.MODEL SMALL
.STACK 100H

.DATA
msgAdd db 'Enter two numbers for addition:$'
msgSub db 'Enter two numbers for subtraction:$'
msgMul db 'Enter two numbers for multiplication:$'
msgDiv db 'Enter two numbers for division:$'
msgResult db 'The result is: $'
errorDivZero db 'Error: Division by zero.$' ; Corrected error message
newline db 13, 10, '$'    ; New line

num1 db ?                 ; First input number
num2 db ?                 ; Second input number
result db ?               ; Result of the operation (8-bit for simplicity)

.CODE
MAIN PROC

    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; ADDITION
    MOV DX, OFFSET msgAdd
    MOV AH, 09H
    INT 21H

    CALL GetNumber         ; Read first number
    MOV num1, AL

    CALL GetNumber         ; Read second number
    MOV num2, AL

    ; Perform addition
    MOV AL, num1
    ADD AL, num2
    MOV result, AL         ; Store result (8-bit register)

    ; Display result
    CALL DisplayResult

    ; SUBTRACTION
    MOV DX, OFFSET msgSub
    MOV AH, 09H
    INT 21H

    CALL GetNumber         ; Read first number
    MOV num1, AL

    CALL GetNumber         ; Read second number
    MOV num2, AL

    ; Perform subtraction
    MOV AL, num1
    SUB AL, num2
    MOV result, AL         ; Store result (8-bit register)

    ; Display result
    CALL DisplayResult

    ; MULTIPLICATION
    MOV DX, OFFSET msgMul
    MOV AH, 09H
    INT 21H

    CALL GetNumber         ; Read first number
    MOV num1, AL

    CALL GetNumber         ; Read second number
    MOV num2, AL

    ; Perform multiplication
    MOV AL, num1
    MOV BL, num2
    MUL BL                 ; Multiply AL by BL, result in AX
    MOV result, AL         ; Store only lower 8 bits of result

    ; Display result
    CALL DisplayResult

    ; DIVISION
    MOV DX, OFFSET msgDiv
    MOV AH, 09H
    INT 21H

    CALL GetNumber         ; Read first number
    MOV num1, AL

    CALL GetNumber         ; Read second number
    MOV num2, AL

    ; Perform division (check for division by zero)
    MOV AL, num1
    MOV BL, num2
    CMP BL, 0
    JZ DivByZero
    DIV BL                 ; Divide AL by BL, result in AL
    MOV result, AL         ; Store result (8-bit register)

    ; Display result
    CALL DisplayResult
    JMP EndProgram

DivByZero:
    MOV DX, OFFSET errorDivZero
    MOV AH, 09H
    INT 21H
    MOV DX, OFFSET newline
    MOV AH, 09H
    INT 21H

EndProgram:
    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

; Subroutine to get a single-digit number from the user
GetNumber PROC
    MOV AH, 01H            ; Function to read character input
    INT 21H
    SUB AL, '0'            ; Convert ASCII to number
    RET
GetNumber ENDP

; Subroutine to display the result
DisplayResult PROC
    MOV DX, OFFSET msgResult
    MOV AH, 09H
    INT 21H

    ; Convert result to ASCII for display
    MOV AL, result
    ADD AL, '0'
    MOV DL, AL
    MOV AH, 02H            ; Display the result
    INT 21H

    MOV DX, OFFSET newline
    MOV AH, 09H
    INT 21H
    RET
DisplayResult ENDP

MAIN ENDP
END MAIN
