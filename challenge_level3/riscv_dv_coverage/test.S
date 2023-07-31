# See LICENSE for license details.

#*****************************************************************************
# add.S
#-----------------------------------------------------------------------------
#
# Test add instruction.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------

  
  TEST_RR_OP( 2,  add, 0x00000000, 0x00000000, 0x00000000 );
  TEST_RR_OP( 3,  add, 0x00000002, 0x00000001, 0x00000001 );
  TEST_RR_OP( 4,  add, 0x0000000a, 0x00000003, 0x00000007 );

  TEST_IMM_OP( 5,  addi, 0x00000000, 0x00000000, 0x000 );
  TEST_IMM_OP( 6,  addi, 0x00000002, 0x00000001, 0x001 );
  TEST_IMM_OP( 7,  addi, 0x0000000a, 0x00000003, 0x007 );


  TEST_RR_OP( 8, and, 0x0f000f00, 0xff00ff00, 0x0f0f0f0f );
  TEST_RR_OP( 9, and, 0x00f000f0, 0x0ff00ff0, 0xf0f0f0f0 );
  TEST_RR_OP( 10, and, 0x000f000f, 0x00ff00ff, 0x0f0f0f0f );
  TEST_RR_OP( 11, and, 0xf000f000, 0xf00ff00f, 0xf0f0f0f0 );


  TEST_IMM_OP( 12, andi, 0xff00ff00, 0xff00ff00, 0xf0f );
  TEST_IMM_OP( 13, andi, 0x000000f0, 0x0ff00ff0, 0x0f0 );
  TEST_IMM_OP( 14, andi, 0x0000000f, 0x00ff00ff, 0x70f );
  TEST_IMM_OP( 15, andi, 0x00000000, 0xf00ff00f, 0x0f0 );

  TEST_BR2_OP_TAKEN( 16, beq,  0,  0 );
  TEST_BR2_OP_TAKEN( 17, beq,  1,  1 );
  TEST_BR2_OP_TAKEN( 18, beq, -1, -1 );

  TEST_BR2_OP_NOTTAKEN( 19, beq,  0,  1 );
  TEST_BR2_OP_NOTTAKEN( 20, beq,  1,  0 );
  TEST_BR2_OP_NOTTAKEN( 21, beq, -1,  1 );
  TEST_BR2_OP_NOTTAKEN( 22, beq,  1, -1 );

  TEST_BR2_OP_TAKEN( 23, bge,  0,  0 );
  TEST_BR2_OP_TAKEN( 24, bge,  1,  1 );
  TEST_BR2_OP_TAKEN( 25, bge, -1, -1 );
  TEST_BR2_OP_TAKEN( 26, bge,  1,  0 );
  TEST_BR2_OP_TAKEN( 27, bge,  1, -1 );
  TEST_BR2_OP_TAKEN( 28, bge, -1, -2 );

  TEST_BR2_OP_NOTTAKEN(  29, bge,  0,  1 );
  TEST_BR2_OP_NOTTAKEN(  30, bge, -1,  1 );
  TEST_BR2_OP_NOTTAKEN( 31, bge, -2, -1 );
  TEST_BR2_OP_NOTTAKEN( 32, bge, -2,  1 );

  TEST_BR2_OP_TAKEN( 33, bgeu, 0x00000000, 0x00000000 );
  TEST_BR2_OP_TAKEN( 34, bgeu, 0x00000001, 0x00000001 );
  TEST_BR2_OP_TAKEN( 35, bgeu, 0xffffffff, 0xffffffff );
  TEST_BR2_OP_TAKEN( 36, bgeu, 0x00000001, 0x00000000 );
  TEST_BR2_OP_TAKEN( 37, bgeu, 0xffffffff, 0xfffffffe );
  TEST_BR2_OP_TAKEN( 38, bgeu, 0xffffffff, 0x00000000 );

  TEST_BR2_OP_NOTTAKEN( 39, bgeu, 0x00000000, 0x00000001 );
  TEST_BR2_OP_NOTTAKEN( 40, bgeu, 0xfffffffe, 0xffffffff );
  TEST_BR2_OP_NOTTAKEN( 41, bgeu, 0x00000000, 0xffffffff );
  TEST_BR2_OP_NOTTAKEN( 42, bgeu, 0x7fffffff, 0x80000000 );

  TEST_BR2_OP_TAKEN( 43, blt,  0,  1 );
  TEST_BR2_OP_TAKEN( 44, blt, -1,  1 );
  TEST_BR2_OP_TAKEN( 45, blt, -2, -1 );

  TEST_BR2_OP_NOTTAKEN( 46, blt,  1,  0 );
  TEST_BR2_OP_NOTTAKEN( 47, blt,  1, -1 );
  TEST_BR2_OP_NOTTAKEN( 48, blt, -1, -2 );
  TEST_BR2_OP_NOTTAKEN( 49, blt,  1, -2 );

  TEST_BR2_OP_TAKEN( 50, bltu, 0x00000000, 0x00000001 );
  TEST_BR2_OP_TAKEN( 51, bltu, 0xfffffffe, 0xffffffff );
  TEST_BR2_OP_TAKEN( 52, bltu, 0x00000000, 0xffffffff );

  TEST_BR2_OP_NOTTAKEN( 53, bltu, 0x00000001, 0x00000000 );
  TEST_BR2_OP_NOTTAKEN( 54, bltu, 0xffffffff, 0xfffffffe );
  TEST_BR2_OP_NOTTAKEN( 55, bltu, 0xffffffff, 0x00000000 );
  TEST_BR2_OP_NOTTAKEN( 56, bltu, 0x80000000, 0x7fffffff );


  TEST_BR2_OP_TAKEN( 57, bne,  0,  1 );
  TEST_BR2_OP_TAKEN( 58, bne,  1,  0 );
  TEST_BR2_OP_TAKEN( 59, bne, -1,  1 );
  TEST_BR2_OP_TAKEN( 60, bne,  1, -1 );

  TEST_BR2_OP_NOTTAKEN( 61, bne,  0,  0 );
  TEST_BR2_OP_NOTTAKEN( 62, bne,  1,  1 );
  TEST_BR2_OP_NOTTAKEN( 63, bne, -1, -1 );
  
  #TEST_RR_SRC1_EQ_DEST( 64, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f );
  #TEST_RR_SRC2_EQ_DEST( 65, or, 0xff0fff0f, 0xff00ff00, 0x0f0f0f0f );
  #TEST_RR_SRC12_EQ_DEST( 66, or, 0xff00ff00, 0xff00ff00 );

  #TEST_IMM_OP( 67, ori, 0xffffffffffffff0f, 0xffffffffff00ff00, 0xf0f );
  #TEST_IMM_OP( 68, ori, 0x000000000ff00ff0, 0x000000000ff00ff0, 0x0f0 );
  #TEST_IMM_OP( 69, ori, 0x0000000000ff07ff, 0x0000000000ff00ff, 0x70f );
  #TEST_IMM_OP( 70, ori, 0xfffffffff00ff0ff, 0xfffffffff00ff00f, 0x0f0 );

  TEST_RR_OP( 71,  sll, 0x0000000000000001, 0x0000000000000001, 0  );
  TEST_RR_OP( 72,  sll, 0x0000000000000002, 0x0000000000000001, 1  );
  TEST_RR_OP( 73,  sll, 0x0000000000000080, 0x0000000000000001, 7  );
  TEST_RR_OP( 74,  sll, 0x0000000000004000, 0x0000000000000001, 14 );
  TEST_RR_OP( 75,  sll, 0x0000000080000000, 0x0000000000000001, 31 );

  TEST_RR_OP( 76,  sll, 0xffffffffffffffff, 0xffffffffffffffff, 0  );
  TEST_RR_OP( 77,  sll, 0xfffffffffffffffe, 0xffffffffffffffff, 1  );
  TEST_RR_OP( 78,  sll, 0xffffffffffffff80, 0xffffffffffffffff, 7  );
  TEST_RR_OP( 79, sll, 0xffffffffffffc000, 0xffffffffffffffff, 14 );
  TEST_RR_OP( 80, sll, 0xffffffff80000000, 0xffffffffffffffff, 31 );

  TEST_RR_OP( 81, sll, 0x0000000021212121, 0x0000000021212121, 0  );
  TEST_RR_OP( 82, sll, 0x0000000042424242, 0x0000000021212121, 1  );
  TEST_RR_OP( 83, sll, 0x0000001090909080, 0x0000000021212121, 7  );
  TEST_RR_OP( 84, sll, 0x0000084848484000, 0x0000000021212121, 14 );
  TEST_RR_OP( 85, sll, 0x1090909080000000, 0x0000000021212121, 31 );



  # Verify that shifts only use bottom six(rv64) or five(rv32) bits

  TEST_RR_OP( 86, sll, 0x0000000021212121, 0x0000000021212121, 0xffffffffffffffc0 );
  TEST_RR_OP( 87, sll, 0x0000000042424242, 0x0000000021212121, 0xffffffffffffffc1 );
  TEST_RR_OP( 88, sll, 0x0000001090909080, 0x0000000021212121, 0xffffffffffffffc7 );
  TEST_RR_OP( 89, sll, 0x0000084848484000, 0x0000000021212121, 0xffffffffffffffce );

   TEST_IMM_OP( 91,  slli, 0x0000000000000001, 0x0000000000000001, 0  );
  TEST_IMM_OP( 92,  slli, 0x0000000000000002, 0x0000000000000001, 1  );
  TEST_IMM_OP( 93,  slli, 0x0000000000000080, 0x0000000000000001, 7  );
  TEST_IMM_OP( 94,  slli, 0x0000000000004000, 0x0000000000000001, 14 );
  TEST_IMM_OP( 95,  slli, 0x0000000080000000, 0x0000000000000001, 31 );

  TEST_IMM_OP( 96,  slli, 0xffffffffffffffff, 0xffffffffffffffff, 0  );
  TEST_IMM_OP( 97,  slli, 0xfffffffffffffffe, 0xffffffffffffffff, 1  );
  TEST_IMM_OP( 98,  slli, 0xffffffffffffff80, 0xffffffffffffffff, 7  );
  TEST_IMM_OP( 99, slli, 0xffffffffffffc000, 0xffffffffffffffff, 14 );
  TEST_IMM_OP( 100, slli, 0xffffffff80000000, 0xffffffffffffffff, 31 );

  TEST_IMM_OP( 101, slli, 0x0000000021212121, 0x0000000021212121, 0  );
  TEST_IMM_OP( 102, slli, 0x0000000042424242, 0x0000000021212121, 1  );
  TEST_IMM_OP( 103, slli, 0x0000001090909080, 0x0000000021212121, 7  );
  TEST_IMM_OP( 104, slli, 0x0000084848484000, 0x0000000021212121, 14 );
  TEST_IMM_OP( 105, slli, 0x1090909080000000, 0x0000000021212121, 31 );

  TEST_RR_OP( 106,  slt, 0, 0x0000000000000000, 0x0000000000000000 );
  TEST_RR_OP( 107,  slt, 0, 0x0000000000000001, 0x0000000000000001 );
  TEST_RR_OP( 108,  slt, 1, 0x0000000000000003, 0x0000000000000007 );
  TEST_RR_OP( 109,  slt, 0, 0x0000000000000007, 0x0000000000000003 );

  TEST_RR_OP( 110,  slt, 0, 0x0000000000000000, 0xffffffffffff8000 );
  TEST_RR_OP( 111,  slt, 1, 0xffffffff80000000, 0x0000000000000000 );
  TEST_RR_OP( 112,  slt, 1, 0xffffffff80000000, 0xffffffffffff8000 );

  TEST_RR_OP( 113,  slt, 1, 0x0000000000000000, 0x0000000000007fff );
  TEST_RR_OP( 114, slt, 0, 0x000000007fffffff, 0x0000000000000000 );
  TEST_RR_OP( 115, slt, 0, 0x000000007fffffff, 0x0000000000007fff );

  TEST_RR_OP( 116, slt, 1, 0xffffffff80000000, 0x0000000000007fff );
  TEST_RR_OP( 117, slt, 0, 0x000000007fffffff, 0xffffffffffff8000 );

  TEST_RR_OP( 118, slt, 0, 0x0000000000000000, 0xffffffffffffffff );
  TEST_RR_OP( 119, slt, 1, 0xffffffffffffffff, 0x0000000000000001 );
  TEST_RR_OP( 120, slt, 0, 0xffffffffffffffff, 0xffffffffffffffff );
 
   TEST_IMM_OP( 121,  slti, 0, 0x0000000000000000, 0x000 );
  TEST_IMM_OP( 122,  slti, 0, 0x0000000000000001, 0x001 );
  TEST_IMM_OP( 123,  slti, 1, 0x0000000000000003, 0x007 );
  TEST_IMM_OP( 124,  slti, 0, 0x0000000000000007, 0x003 );

  TEST_IMM_OP( 125,  slti, 0, 0x0000000000000000, 0x800 );
  TEST_IMM_OP( 126,  slti, 1, 0xffffffff80000000, 0x000 );
  TEST_IMM_OP( 127,  slti, 1, 0xffffffff80000000, 0x800 );

  TEST_IMM_OP( 128,  slti, 1, 0x0000000000000000, 0x7ff );
  TEST_IMM_OP( 129, slti, 0, 0x000000007fffffff, 0x000 );
  TEST_IMM_OP( 130, slti, 0, 0x000000007fffffff, 0x7ff );

  TEST_IMM_OP( 131, slti, 1, 0xffffffff80000000, 0x7ff );
  TEST_IMM_OP( 132, slti, 0, 0x000000007fffffff, 0x800 );

  TEST_IMM_OP( 133, slti, 0, 0x0000000000000000, 0xfff );
  TEST_IMM_OP( 134, slti, 1, 0xffffffffffffffff, 0x001 );
  TEST_IMM_OP( 135, slti, 0, 0xffffffffffffffff, 0xfff );

  TEST_IMM_OP( 136,  sltiu, 0, 0x0000000000000000, 0x000 );
  TEST_IMM_OP( 137,  sltiu, 0, 0x0000000000000001, 0x001 );
  TEST_IMM_OP( 138,  sltiu, 1, 0x0000000000000003, 0x007 );
  TEST_IMM_OP( 139,  sltiu, 0, 0x0000000000000007, 0x003 );

  TEST_IMM_OP( 140,  sltiu, 1, 0x0000000000000000, 0x800 );
  TEST_IMM_OP( 141,  sltiu, 0, 0xffffffff80000000, 0x000 );
  TEST_IMM_OP( 142,  sltiu, 1, 0xffffffff80000000, 0x800 );

  TEST_IMM_OP( 143,  sltiu, 1, 0x0000000000000000, 0x7ff );
  TEST_IMM_OP( 144, sltiu, 0, 0x000000007fffffff, 0x000 );
  TEST_IMM_OP( 145, sltiu, 0, 0x000000007fffffff, 0x7ff );

  TEST_IMM_OP( 146, sltiu, 0, 0xffffffff80000000, 0x7ff );
  TEST_IMM_OP( 147, sltiu, 1, 0x000000007fffffff, 0x800 );

  TEST_IMM_OP( 148, sltiu, 1, 0x0000000000000000, 0xfff );
  TEST_IMM_OP( 149, sltiu, 0, 0xffffffffffffffff, 0x001 );
  TEST_IMM_OP( 150, sltiu, 0, 0xffffffffffffffff, 0xfff );

  TEST_RR_OP( 151,  sltu, 0, 0x00000000, 0x00000000 );
  TEST_RR_OP( 152,  sltu, 0, 0x00000001, 0x00000001 );
  TEST_RR_OP( 153,  sltu, 1, 0x00000003, 0x00000007 );
  TEST_RR_OP( 154,  sltu, 0, 0x00000007, 0x00000003 );

  TEST_RR_OP( 155,  sltu, 1, 0x00000000, 0xffff8000 );
  TEST_RR_OP( 156,  sltu, 0, 0x80000000, 0x00000000 );
  TEST_RR_OP( 157,  sltu, 1, 0x80000000, 0xffff8000 );

  TEST_RR_OP( 158,  sltu, 1, 0x00000000, 0x00007fff );
  TEST_RR_OP( 159, sltu, 0, 0x7fffffff, 0x00000000 );
  TEST_RR_OP( 160, sltu, 0, 0x7fffffff, 0x00007fff );

  TEST_RR_OP( 161, sltu, 0, 0x80000000, 0x00007fff );
  TEST_RR_OP( 162, sltu, 1, 0x7fffffff, 0xffff8000 );

  TEST_RR_OP( 163, sltu, 1, 0x00000000, 0xffffffff );
  TEST_RR_OP( 164, sltu, 0, 0xffffffff, 0x00000001 );
  TEST_RR_OP( 165, sltu, 0, 0xffffffff, 0xffffffff );

  TEST_RR_OP( 166,  sra, 0xffffffff80000000, 0xffffffff80000000, 0  );
  TEST_RR_OP( 167,  sra, 0xffffffffc0000000, 0xffffffff80000000, 1  );
  TEST_RR_OP( 168,  sra, 0xffffffffff000000, 0xffffffff80000000, 7  );
  TEST_RR_OP( 169,  sra, 0xfffffffffffe0000, 0xffffffff80000000, 14 );
  TEST_RR_OP( 170,  sra, 0xffffffffffffffff, 0xffffffff80000001, 31 );

  TEST_RR_OP( 171,  sra, 0x000000007fffffff, 0x000000007fffffff, 0  );
  TEST_RR_OP( 172,  sra, 0x000000003fffffff, 0x000000007fffffff, 1  );
  TEST_RR_OP( 173,  sra, 0x0000000000ffffff, 0x000000007fffffff, 7  );
  TEST_RR_OP( 174, sra, 0x000000000001ffff, 0x000000007fffffff, 14 );
  TEST_RR_OP( 175, sra, 0x0000000000000000, 0x000000007fffffff, 31 );

  TEST_RR_OP( 176, sra, 0xffffffff81818181, 0xffffffff81818181, 0  );
  TEST_RR_OP( 177, sra, 0xffffffffc0c0c0c0, 0xffffffff81818181, 1  );
  TEST_RR_OP( 178, sra, 0xffffffffff030303, 0xffffffff81818181, 7  );
  TEST_RR_OP( 179, sra, 0xfffffffffffe0606, 0xffffffff81818181, 14 );
  TEST_RR_OP( 180, sra, 0xffffffffffffffff, 0xffffffff81818181, 31 );

  # Verify that shifts only use bottom six(rv64) or five(rv32) bits

  TEST_RR_OP( 181, sra, 0xffffffff81818181, 0xffffffff81818181, 0xffffffffffffffc0 );
  TEST_RR_OP( 182, sra, 0xffffffffc0c0c0c0, 0xffffffff81818181, 0xffffffffffffffc1 );
  TEST_RR_OP( 183, sra, 0xffffffffff030303, 0xffffffff81818181, 0xffffffffffffffc7 );
  TEST_RR_OP( 184, sra, 0xfffffffffffe0606, 0xffffffff81818181, 0xffffffffffffffce );
  TEST_RR_OP( 185, sra, 0xffffffffffffffff, 0xffffffff81818181, 0xffffffffffffffff );

  TEST_IMM_OP( 186,  srai, 0xffffff8000000000, 0xffffff8000000000, 0  );
  TEST_IMM_OP( 187,  srai, 0xffffffffc0000000, 0xffffffff80000000, 1  );
  TEST_IMM_OP( 188,  srai, 0xffffffffff000000, 0xffffffff80000000, 7  );
  TEST_IMM_OP( 189,  srai, 0xfffffffffffe0000, 0xffffffff80000000, 14 );
  TEST_IMM_OP( 190,  srai, 0xffffffffffffffff, 0xffffffff80000001, 31 );

  TEST_IMM_OP( 191,  srai, 0x000000007fffffff, 0x000000007fffffff, 0  );
  TEST_IMM_OP( 192,  srai, 0x000000003fffffff, 0x000000007fffffff, 1  );
  TEST_IMM_OP( 193,  srai, 0x0000000000ffffff, 0x000000007fffffff, 7  );
  TEST_IMM_OP( 194, srai, 0x000000000001ffff, 0x000000007fffffff, 14 );
  TEST_IMM_OP( 195, srai, 0x0000000000000000, 0x000000007fffffff, 31 );

  TEST_IMM_OP( 196, srai, 0xffffffff81818181, 0xffffffff81818181, 0  );
  TEST_IMM_OP( 197, srai, 0xffffffffc0c0c0c0, 0xffffffff81818181, 1  );
  TEST_IMM_OP( 198, srai, 0xffffffffff030303, 0xffffffff81818181, 7  );
  TEST_IMM_OP( 199, srai, 0xfffffffffffe0606, 0xffffffff81818181, 14 );
  TEST_IMM_OP( 200, srai, 0xffffffffffffffff, 0xffffffff81818181, 31 );


  # Verify that shifts only use bottom six(rv64) or five(rv32) bits

  TEST_RR_OP( 201, srl, 0x0000000021212121, 0x0000000021212121, 0xffffffffffffffc0 );
  TEST_RR_OP( 202, srl, 0x0000000010909090, 0x0000000021212121, 0xffffffffffffffc1 );
  TEST_RR_OP( 203, srl, 0x0000000000424242, 0x0000000021212121, 0xffffffffffffffc7 );
  TEST_RR_OP( 204, srl, 0x0000000000008484, 0x0000000021212121, 0xffffffffffffffce );
  TEST_RR_OP( 205, srl, 0x0000000000000000, 0x0000000021212121, 0xffffffffffffffff );
 
  TEST_RR_OP( 206,  sub, 0x0000000000000000, 0x0000000000000000, 0x0000000000000000 );
  TEST_RR_OP( 207,  sub, 0x0000000000000000, 0x0000000000000001, 0x0000000000000001 );
  TEST_RR_OP( 208,  sub, 0xfffffffffffffffc, 0x0000000000000003, 0x0000000000000007 );

  TEST_RR_OP( 209,  sub, 0x0000000000008000, 0x0000000000000000, 0xffffffffffff8000 );
  TEST_RR_OP( 210,  sub, 0xffffffff80000000, 0xffffffff80000000, 0x0000000000000000 );
  TEST_RR_OP( 211,  sub, 0xffffffff80008000, 0xffffffff80000000, 0xffffffffffff8000 );

  TEST_RR_OP( 212,  sub, 0xffffffffffff8001, 0x0000000000000000, 0x0000000000007fff );
  TEST_RR_OP( 213,  sub, 0x000000007fffffff, 0x000000007fffffff, 0x0000000000000000 );
  TEST_RR_OP( 214, sub, 0x000000007fff8000, 0x000000007fffffff, 0x0000000000007fff );

  TEST_RR_OP( 215, sub, 0xffffffff7fff8001, 0xffffffff80000000, 0x0000000000007fff );
  TEST_RR_OP( 216, sub, 0x0000000080007fff, 0x000000007fffffff, 0xffffffffffff8000 );

  TEST_RR_OP( 217, sub, 0x0000000000000001, 0x0000000000000000, 0xffffffffffffffff );
  TEST_RR_OP( 218, sub, 0xfffffffffffffffe, 0xffffffffffffffff, 0x0000000000000001 );
  TEST_RR_OP( 219, sub, 0x0000000000000000, 0xffffffffffffffff, 0xffffffffffffffff );

   
  TEST_RR_OP( 220, xor, 0xf00ff00f, 0xff00ff00, 0x0f0f0f0f );
  TEST_RR_OP( 221, xor, 0xff00ff00, 0x0ff00ff0, 0xf0f0f0f0 );
  TEST_RR_OP( 222, xor, 0x0ff00ff0, 0x00ff00ff, 0x0f0f0f0f );
  TEST_RR_OP( 223, xor, 0x00ff00ff, 0xf00ff00f, 0xf0f0f0f0 );

  TEST_IMM_OP( 224, xori, 0xffffffffff00f00f, 0x0000000000ff0f00, 0xf0f );
  TEST_IMM_OP( 225, xori, 0x000000000ff00f00, 0x000000000ff00ff0, 0x0f0 );
  TEST_IMM_OP( 226, xori, 0x0000000000ff0ff0, 0x0000000000ff08ff, 0x70f );
  TEST_IMM_OP( 227, xori, 0xfffffffff00ff0ff, 0xfffffffff00ff00f, 0x0f0 );

#define TEST_SRLI(n, v, a) \
  TEST_IMM_OP(n, srli, ((v) & ((1 << (__riscv_xlen-1) << 1) - 1)) >> (a), v, a)

  TEST_SRLI( 228,  0xffffffff80000000, 0  );
  TEST_SRLI( 229,  0xffffffff80000000, 1  );
  TEST_SRLI( 230,  0xffffffff80000000, 7  );
  TEST_SRLI( 231,  0xffffffff80000000, 14 );
  TEST_SRLI( 232,  0xffffffff80000001, 31 );

  TEST_SRLI( 233,  0xffffffffffffffff, 0  );
  TEST_SRLI( 234,  0xffffffffffffffff, 1  );
  TEST_SRLI( 235,  0xffffffffffffffff, 7  );
  TEST_SRLI( 236, 0xffffffffffffffff, 14 );
  TEST_SRLI( 237, 0xffffffffffffffff, 31 );

  TEST_SRLI( 238, 0x0000000021212121, 0  );
  TEST_SRLI( 239, 0x0000000021212121, 1  );
  TEST_SRLI( 240, 0x0000000021212121, 7  );
  TEST_SRLI( 241, 0x0000000021212121, 14 );
  TEST_SRLI( 242, 0x0000000021212121, 31 );

  #-------------------------------------------------------------
  # Source/Destination tests
  #-------------------------------------------------------------

  TEST_IMM_SRC1_EQ_DEST( 243, srli, 0x01000000, 0x80000000, 7 );

  #-------------------------------------------------------------
  # Bypassing tests
  #-------------------------------------------------------------

  TEST_IMM_DEST_BYPASS( 244, 0, srli, 0x01000000, 0x80000000, 7  );
  TEST_IMM_DEST_BYPASS( 245, 1, srli, 0x00020000, 0x80000000, 14 );
  TEST_IMM_DEST_BYPASS( 246, 2, srli, 0x00000001, 0x80000001, 31 );

  TEST_IMM_SRC1_BYPASS( 247, 0, srli, 0x01000000, 0x80000000, 7  );
  TEST_IMM_SRC1_BYPASS( 248, 1, srli, 0x00020000, 0x80000000, 14 );
  TEST_IMM_SRC1_BYPASS( 249, 2, srli, 0x00000001, 0x80000001, 31 );

  TEST_IMM_ZEROSRC1( 250, srli, 0, 4 );
  TEST_IMM_ZERODEST( 251, srli, 33, 10 );
  
  TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
 
 