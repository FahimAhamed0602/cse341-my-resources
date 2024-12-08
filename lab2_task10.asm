.MODEL SMALL
.STACK 100H

.DATA
prompt1 db 'Enter three numbers: $'
prompt2 db 'Maximum number is: $'
prompt3 db 'Minimum number is: $'
num1 db ?
num2 db ?
num3 db ?
max db ?
min db ?

.CODE
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX

   
    MOV AH, 09H
    LEA DX, prompt1
    INT 21H

   
    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV num1, AL

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV num2, AL

    MOV AH, 01H
    INT 21H
    SUB AL, 30H
    MOV num3, AL


    MOV AL, num1
    CMP AL, num2
    JG max1
    MOV AL, num2
max1:
    CMP AL, num3
    JG max2
    MOV AL, num3
max2:
    MOV max, AL

    
    MOV AL, num1
    CMP AL, num2
    JL min1
    MOV AL, num2
min1:
    CMP AL, num3
    JL min2
    MOV AL, num3
min2:
    MOV min, AL


    MOV AH, 09H
    LEA DX, prompt2
    INT 21H

    MOV AL, max
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

 
    MOV AH, 09H
    LEA DX, prompt3
    INT 21H

    MOV AL, min
    ADD AL, 30H
    MOV DL, AL
    MOV AH, 02H
    INT 21H

    ; Exit to DOS
    MOV AH, 4CH
    INT 21H

MAIN ENDP
END MAIN