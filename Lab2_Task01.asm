.MODEL SMALL
.STACK 100H

.DATA
msg db 'Please insert a character: $'  ; Message to prompt the user
input db ?                             ; Variable to store the character input

.CODE
MAIN PROC

    ; Initialize DS
    MOV AX, @DATA
    MOV DS, AX

    ; Display prompt message
    MOV DX, OFFSET msg
    MOV AH, 09H
    INT 21H

    ; Take a character input
    MOV AH, 01H
    INT 21H
    MOV input, AL                     ; Store input character in 'input' variable

    ; Display the entered character
    MOV AH, 02H
    MOV DL, input
    INT 21H

    ; Exit to DOS
    MOV AX, 4C00H
    INT 21H

MAIN ENDP
END MAIN
