
; Assuming you want to compare two numbers and display the larger one

DATA SEGMENT
    NUM1 DB 34
    NUM2 DB 38
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA

    START:
        MOV AX, DATA
        MOV DS, AX

        MOV AL, NUM1
        CMP AL, NUM2

        JA GREATER_A
        JG GREATER_B

    GREATER_A:
        MOV DL, NUM1
        JMP DISPLAY

    GREATER_B:
        MOV DL, NUM2

    DISPLAY:
        MOV AH, 02H ; Function 02H to display a character
        INT 21H

        MOV AH, 4CH ; Function 4CH to terminate the program
        INT 21H

CODE ENDS
END START
