#include </Users/liqinghua/git/wasmLearning/WasmVM/test/unittests/lib/core/runtime/i64_shl_unittest.hpp>

int main(int argc, char *argv[]){
    skypat::Test::Initialize(argc, argv);
    skypat::Test::RunAll();
    return (skypat::testing::UnitTest::self()->getNumOfFails() == 0) ? EXIT_SUCCESS : EXIT_FAILURE;
}
