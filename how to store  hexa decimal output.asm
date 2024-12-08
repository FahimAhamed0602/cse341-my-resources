
 
.STACK 100H

.DATA

.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
 
mov dl,15h

mov ah,2

int 21h
;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
