// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
// Pseudocode:
//
// int p = R0;
// int q = R1;
// int i;
// for (i = 0, i < q; i++) {
//     R2 = R2 + p;
// }
//
// Pseudocode Test:
//
// p = R0 = 5, q = R1 = 6
//
// i = 0 < 6
// R2 = 0 + 5 = 5
//
// i = 1 < 6
// R2 = 5 + 5 = 10
//
// i = 2 < 6
// R2 = 10 + 5 = 15
//
// i = 3 < 6
// R2 = 15 + 5 = 20
// 
// i = 4 < 6
// R2 = 20 + 5 = 25
//
// i = 5 < 6
// R2 = 25 + 5 = 30
//
// i = 6 < 6 (FALSE) -> Terminate
// R2 = 30 (FINAL) -> CORRECT RESULT
//
// Assembly:

    @R0     // 0: Set A=0, M:=RAM[0]
    D=M     // 1: Set D=RAM[0]
    @p      // 2: Set A=16, M:=RAM[16]
    M=D     // 3: Set RAM[16]=RAM[0]=p

    @R1     // 4: Set A=1, M:=RAM[1]
    D=M     // 5: Set D=RAM[1]
    @q      // 6: Set A=17, M:=RAM[17]
    M=D     // 7: Set RAM[17]=RAM[1]=q

    @R2     // 8: Set A=2, M:=RAM[2]
    M=0     // 9: Set RAM[2]=0

    @i      // 10: Set A=18, M:=RAM[18]
    M=0     // 11: Set RAM[18]=i=0

(LOOP)
    @i      // 12: Set A=18, M:=RAM[18]
    D=M     // 13: Set D=RAM[18]
    @q      // 14: Set A=17, M:=RAM[17]
    D=D-M   // 15: Set D=RAM[18]-RAM[17]

    @END    // 16: Set A=END+1, M:=RAM[END+1]
    D;JEQ   // 17: Jump to A=END+1 if D=RAM[18]-RAM[17]=0

    @R2     // 18: Set A=2, M:=RAM[2]
    D=M     // 19: Set D=RAM[2]
    @p      // 20: Set A=16, M:=RAM[16]
    D=D+M   // 21: Set D=RAM[2]+RAM[16]
    @R2     // 22: Set A=2, M:=RAM[2]
    M=D     // 23: Set RAM[2]=RAM[2]+RAM[16]

    @i      // 24: Set A=18, M:=RAM[18]
    M=M+1   // 25: Set RAM[18]=RAM[18]+1

    @LOOP   // 26: Set A=LOOP+1, M:=RAM[LOOP+1]
    0;JMP   // 27: Jump to A=LOOP+1
(END)
    @END    // 28: Set A=END+1, M:=RAM[END+1]
    0;JMP   // 29: Jump to A=END+1