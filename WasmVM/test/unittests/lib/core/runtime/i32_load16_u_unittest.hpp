#include <skypat/skypat.h>
#define _Bool bool
extern "C" {
#include <dataTypes/Value.h>
#include <core/Runtime.h>
#include <string.h>
#include <stdint.h>
}
#undef _Bool
SKYPAT_F(runtime_i32_load16_u, regular)
{
    // Prepare
    Stack stack = new_Stack();
    MemInst* memory = new_MemInst();
    memory->max = 1;
    int32_t data[] = { 60000, 50000, 65537, 65540, 65550 };
    size_t data_size = sizeof(data)/sizeof(data[0]);
    uint32_t byteLen = 8 * sizeof(int32_t);
    uint32_t offset = 4 * sizeof(int32_t);
    uint8_t* bytePtr = (uint8_t*) data;
    uint8_t zero = 0;

    for(int32_t lop = 0; lop < offset; lop++) {
        vector_push_back(memory->data, (const void *)&zero);
    }
    for(int32_t lop = 0; lop < byteLen; lop++) {
        vector_push_back(memory->data, (const void *)(bytePtr + lop));
    }
    for(uint8_t lop = 0; lop < data_size; lop++) {
        // Set load location
        push_Value(stack, new_i32Value(lop * sizeof(int32_t)));
        // Run
        runtime_i32_load16_u(stack, memory, offset, 0);
        // Check
        Value *check = NULL;
        pop_Value(stack,&check);
        EXPECT_EQ(check->value.i32, (uint16_t)data[lop]);
        // Clean
        free_Value(check);
    }
    // error check
    push_Value(stack, new_i32Value(65540));
    int ret = runtime_i32_load16_u(stack, memory, offset, 0);
    EXPECT_EQ(ret, -1);
    // clean datas
    free_MemInst(memory);
    free_Stack(stack);
}
