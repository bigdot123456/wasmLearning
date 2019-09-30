//===- main.cpp -----------------------------------------------------------===//
//
//                              The SkyPat Team
//
// This file is distributed under the New BSD License.
// See LICENSE for details.
//
//===----------------------------------------------------------------------===//
//
// If you're like us, you'd like to look at some SkyPat sample code. The
// examples/ folder has a numebr of well-commented samples show you how to
// use SkyPat features.
//
// This sample shows how to write a simple performance test for a function,
// using SkyPat framework.
//
//===----------------------------------------------------------------------===//

// Step 1. Include necessary header files such that the stuff your test logic
// needs is declared.
#include "skypat/skypat.h"
#include "my_case.h"

// Step 2. Use the macro to define your performance test.
//
// SKYPAT macro has two parameters: the case name and the test name.
// After using the macro, you must define your test logic between a pair of
// braces.
//
// In SkyPat, test logics are grouped into `cases`. Every case has a bunch of
// `tests`. This is how we organize the test codes. You should put logically
// related tests into the same test case.
//
// Every test contains two parts: performance test and unit-test.
// PERFORM macro is used to measure the performance of code within a test;
// ASSERT macro compares the actual value to an expected value by using the
// equals operator. skypat remembers the performance number of a test only if
// all unit-tests in the test are passed.
//
// The names of cases and tests should be valid C++ identifiers.
//
// SkyPat does NOT guarantee that every tests you define is run exactly once.
// In fact, SkyPat runs a test repeatedly for getting precise performance
// numbers. Therefore, you should guarantee that in all runs the initial value
// of a variable of a test is fixed.
SKYPAT_F(Fibonacci, fibonacci_result)
{
  int result = 0;

  PERFORM(skypat::CONTEXT_SWITCHES) {
    result = fibonacci(5);
  }

  EXPECT_TRUE(result == 8);

  PERFORM(skypat::CONTEXT_SWITCHES) {
    result = fibonacci(10);
  }

  EXPECT_TRUE(result == 89);
}

SKYPAT_F(Fibonacci, fibonacci_special_case)
{
  int result = 0;

  PERFORM(skypat::CONTEXT_SWITCHES) {
    result = fibonacci(-1);
  }

  EXPECT_TRUE(result == 1);
}


SKYPAT_F(Factorial, factorial_result)
{
  int result = 0;

  PERFORM(skypat::CONTEXT_SWITCHES) {
    result = factorial(5);
  }

  EXPECT_TRUE(result == 120);

  PERFORM(skypat::CONTEXT_SWITCHES) {
    result = factorial(10);
  }

  EXPECT_TRUE(result == 3628800);
}

SKYPAT_F(Factorial, factorial_special_case)
{
  int result = 0;

  PERFORM(skypat::CONTEXT_SWITCHES) {
    result = factorial(-1);
  }

  EXPECT_TRUE(result == 1);
}

// Step 3. Call RunAll() in main().
//
// This runs all the tests you've defined, prints the result and
// return 0 if succeed, or 1 otherwise.
//
// Did you notice that we didn't register any tests? The RunAll()
// function magically knows about all the test we defined. Isn't it
// convenient?
int main(int argc, char* argv[])
{
  skypat::Test::Initialize(argc, argv);
  skypat::Test::RunAll();
}
