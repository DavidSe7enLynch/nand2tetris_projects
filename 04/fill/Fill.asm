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

(ZERO_I)
    @16384
    D=A
    @i  // ram row for screen
    M=0
    M=D+M

(LOOP)
    @24576
    D=M
    @BLACK
    D;JNE

// white
    @i
    D=M
    A=D
    M=0
    @UPDATE_I
    0;JMP

(BLACK)
    @i
    D=M
    A=D
    M=-1

(UPDATE_I)
    @i
    M=M+1
    D=M
    @24575  // end ram row of screen
    D=D-A
    @ZERO_I
    D;JGT

    @LOOP
    0;JMP