// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.    
(STANDBY)
    @KBD        // 0: Set A=24576, M:=RAM[24576]
    D=M         // 1: Set D=RAM[24576]
    @FILL       // 2: Set A=FILL+1, M:=RAM[FILL+1]
    D;JNE       // 3: If D=RAM[24576] != 0, jump to A=FILL+1
    @CLEAR      // 4: Set A=CLEAR+1, M:=RAM[CLEAR+1]
    0;JMP       // 5: Jump to A=CLEAR+1
    @STANDBY    // 6: Set A=STANDBY+1, M:=RAM[STANDBY+1]
    0;JMP       // 7: Jump to A=STANDBY+1
(FILL)
    @i          // 8: Set A=16, M:=RAM[16]
    M=0         // 9: Set RAM[16]=0
(LOOP_0)
    @i          // 10: Set A=16, M:=RAM[16]
    D=M         // 11: Set D=RAM[16]
    @8192       // 12: Set A=8192, M:=RAM[8192]
    D=D-A       // 15: Set D=RAM[16]-8192
    @STANDBY    // 16: Set A=STANDBY+1, M:=RAM[STANDBY+1]
    D;JEQ       // 17: If D=0, jump to A=STANDBY+1
    @i          // 18: Set A=16, M:RAM[16]
    D=M         // 19: Set D=RAM[16]
    @SCREEN     // 20: Set A=16384, M:=RAM[16384]
    A=D+A       // 21: Set A=RAM[16]+16384
    M=-1        // 22: Set RAM[16384]=-1=1111 1111 1111 1111
    @i          // 23: Set A=16, M:=RAM[16]
    M=M+1       // 24: Set RAM[16]=RAM[16]+1
    @LOOP_0     // 25: Set A=LOOP_0+1, M:=RAM[LOOP_0+1]
    0;JMP       // 26: Jump to A=LOOP_0+1
(CLEAR)
    @i          // 27: Set A=16, M:=RAM[16]
    M=0         // 28: Set RAM[16]=0
(LOOP_1)
    @i          // 29: Set A=16, M:=RAM[16]
    D=M         // 30: Set D=RAM[16]
    @8192       // 31: Set A=8192, M:=RAM[8192]
    D=D-A       // 32: Set D=RAM[16]-8192
    @STANDBY    // 33: Set A=STANDBY+1, M:=RAM[STANDBY+1]
    D;JEQ       // 34: If D=0, jump to A=STANDBY+1
    @i          // 35: Set A=16, M:RAM[16]
    D=M         // 36: Set D=RAM[16]
    @SCREEN     // 37: Set A=16384, M:=RAM[16384]
    A=D+A       // 38: Set A=RAM[16]+16384
    M=0         // 39: Set RAM[16384]=0=0000 0000 0000 0000
    @i          // 40: Set A=16, M:=RAM[16]
    M=M+1       // 41: Set RAM[16]=RAM[16]+1
    @LOOP_1     // 42: Set A=LOOP_0+1, M:=RAM[LOOP_0+1]
    0;JMP       // 43: Jump to A=LOOP_0+1