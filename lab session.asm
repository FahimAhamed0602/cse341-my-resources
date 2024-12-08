.MODEL SMALL
.STACK 100H
.DATA 
; Messages
MSG_ENTER_FIRST DB "ENTER FIRST NUMBER: $"
MSG_ENTER_SECOND DB "ENTER SECOND NUMBER: $"
MSG_SUM DB "SUM: $"
MSG_A_GREATER DB "A IS GREATER $"
MSG_B_GREATER DB "B IS GREATER OR EQUAL $"

; Variables
RESULT DB ? ; Changed to 8-bit to match BL
MAX DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

; ================================================
; Input Two Numbers and Display their Sum
; ================================================
    ; Display first message
    LEA DX, MSG_ENTER_FIRST
    MOV AH, 9
    INT 21H

    ; Input first number
    MOV AH, 1
    INT 21H
    SUB AL, 48 ; Convert ASCII to number
    MOV BL, AL ; Store first number in BL

    ; New line
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H

    ; Display second message
    LEA DX, MSG_ENTER_SECOND
    MOV AH, 9
    INT 21H

    ; Input second number
    MOV AH, 1
    INT 21H
    SUB AL, 48 ; Convert ASCII to number
    MOV CL, AL ; Store second number in CL

    ; Compute sum
    ADD BL, CL
    MOV RESULT, BL ; Store result in 8-bit variable

    ; Display sum message
    LEA DX, MSG_SUM
    MOV AH, 9
    INT 21H

    ; Output result
    MOV DL, RESULT
    ADD DL, 48 ; Convert to ASCII
    MOV AH, 2
    INT 21H

; ================================================
; Compare Two Numbers
; ================================================
    MOV AL, 4 ; Example value
    MOV BL, 2 ; Example value
    CMP AL, BL
    JG A_IS_GREATER
    LEA DX, MSG_B_GREATER
    MOV AH, 9
    INT 21H
    JMP COMP_EXIT

A_IS_GREATER:
    LEA DX, MSG_A_GREATER
    MOV AH, 9
    INT 21H

COMP_EXIT:

; ================================================
; Exit Program
; ================================================
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
