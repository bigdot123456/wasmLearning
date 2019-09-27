//! The `ExportedFunction` and relative collection that encapsulate Wasmer
//!  memory and instances.
//!

use super::inspect::InspectExportedFunction;
use crate::value::Value;
use pyo3::{
    class::basic::PyObjectProtocol,
    exceptions::{LookupError, RuntimeError},
    prelude::*,
    types::{PyFloat, PyLong, PyTuple},
    ToPyObject,
};
use std::rc::Rc;
use wasmer_runtime::{self as runtime, Value as WasmValue};
use wasmer_runtime_core::instance::DynFunc;
use wasmer_runtime_core::types::Type;

#[pyclass]
/// `ExportedFunction` is a Python class that represents a WebAssembly
/// exported function. Such a function can be invoked from Python by using the
/// `__call__` Python class method.
pub struct ExportedFunction {
    /// The underlying Rust WebAssembly instance.
    instance: Rc<runtime::Instance>,

    /// The exported function name from the WebAssembly module.
    function_name: String,
}

/// Implement the `InspectExportedFunction` trait.
impl InspectExportedFunction for ExportedFunction {
    fn move_runtime_func_obj(&self) -> Result<DynFunc, PyErr> {
        match self.instance.dyn_func(&self.function_name) {
            Ok(function) => Ok(function),
            Err(_) => {
                return Err(RuntimeError::py_err(format!(
                    "Function `{}` does not exist.",
                    self.function_name
                )))
            }
        }
    }

    fn signature(&self) -> String {
        let function = &self.move_runtime_func_obj().unwrap();
        let signature = function.signature();

        format!("{}: {:?}", &self.function_name, signature)
    }

    fn params(&self) -> String {
        let function = &self.move_runtime_func_obj().unwrap();
        let signature = function.signature();

        format!("{}: {:?}", &self.function_name, signature.params())
    }
}

#[pymethods]
/// Implement methods on the `ExportedFunction` Python class.
impl ExportedFunction {
    #[call]
    #[args(arguments = "*")]
    // The `ExportedFunction.__call__` method.
    // The `#[args(arguments = "*")]` means that the method has an
    // unfixed arity. All parameters will be received in the
    // `arguments` argument.
    fn __call__(&self, py: Python, arguments: &PyTuple) -> PyResult<PyObject> {
        // Get the exported function.
        let function: DynFunc = self.move_runtime_func_obj().unwrap();

        // Check the given arguments match the exported function signature.
        let signature = function.signature();
        let parameters = signature.params();

        let number_of_parameters = parameters.len() as isize;
        let number_of_arguments = arguments.len() as isize;
        let diff: isize = number_of_parameters - number_of_arguments;

        if diff > 0 {
            return Err(RuntimeError::py_err(format!(
                "Missing {} argument(s) when calling `{}`: Expect {} argument(s), given {}.",
                diff, self.function_name, number_of_parameters, number_of_arguments
            )));
        } else if diff < 0 {
            return Err(RuntimeError::py_err(format!(
                "Given {} extra argument(s) when calling `{}`: Expect {} argument(s), given {}.",
                diff.abs(),
                self.function_name,
                number_of_parameters,
                number_of_arguments
            )));
        }

        // Map Python arguments to WebAssembly values.
        let mut function_arguments = Vec::<WasmValue>::with_capacity(number_of_parameters as usize);

        for (parameter, argument) in parameters.iter().zip(arguments.iter()) {
            let value = match argument.downcast_ref::<Value>() {
                Ok(value) => value.value.clone(),
                Err(_) => match parameter {
                    Type::I32 => {
                        WasmValue::I32(argument.downcast_ref::<PyLong>()?.extract::<i32>()?)
                    }
                    Type::I64 => {
                        WasmValue::I64(argument.downcast_ref::<PyLong>()?.extract::<i64>()?)
                    }
                    Type::F32 => {
                        WasmValue::F32(argument.downcast_ref::<PyFloat>()?.extract::<f32>()?)
                    }
                    Type::F64 => {
                        WasmValue::F64(argument.downcast_ref::<PyFloat>()?.extract::<f64>()?)
                    }
                    Type::V128 => {
                        WasmValue::V128(argument.downcast_ref::<PyLong>()?.extract::<u128>()?)
                    }
                },
            };

            function_arguments.push(value);
        }

        // Call the exported function.
        let results = match function.call(function_arguments.as_slice()) {
            Ok(results) => results,
            Err(e) => return Err(RuntimeError::py_err(format!("{}", e))),
        };

        // Map the WebAssembly first result to a Python value.
        if results.len() > 0 {
            Ok(match results[0] {
                WasmValue::I32(result) => result.to_object(py),
                WasmValue::I64(result) => result.to_object(py),
                WasmValue::F32(result) => result.to_object(py),
                WasmValue::F64(result) => result.to_object(py),
                WasmValue::V128(result) => result.to_object(py),
            })
        } else {
            Ok(py.None())
        }
    }

    #[getter]
    // On the blueprint of Python's `inpect.getfullargspec`
    fn getfullargspec(&self) -> PyResult<String> {
        Ok(self.signature())
    }

    #[getter]
    fn getargs(&self) -> PyResult<String> {
        Ok(self.params())
    }
}

#[pyclass]
/// `ExportedFunctions` is a Python class that represents the set
/// of WebAssembly exported functions. It's basically a set of
/// `ExportedFunction` classes.
///
/// # Examples
///
/// ```python
/// from wasmer import Instance
///
/// instance = Instance(wasm_bytes)
/// result = instance.exports.sum(1, 2)
/// ```
pub struct ExportedFunctions {
    /// The underlying Rust WebAssembly instance.
    pub(crate) instance: Rc<runtime::Instance>,

    /// Available exported function names from the WebAssembly module.
    pub(crate) functions: Vec<String>,
}

#[pyproto]
/// Implement the Python object protocol on the `ExportedFunctions`
/// Python class.
impl PyObjectProtocol for ExportedFunctions {
    /// An Python attribute in this context represents a WebAssembly
    /// exported function name.
    fn __getattr__(&self, key: String) -> PyResult<ExportedFunction> {
        if self.functions.contains(&key) {
            Ok(ExportedFunction {
                function_name: key,
                instance: self.instance.clone(),
            })
        } else {
            Err(LookupError::py_err(format!(
                "Function `{}` does not exist.",
                key
            )))
        }
    }

    fn __repr__(&self) -> PyResult<String> {
        Ok(format!("{:?}", self.functions))
    }
}
