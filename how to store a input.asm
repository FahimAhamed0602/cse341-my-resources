
 
.STACK 100H

.DATA

.CODE
MAIN PROC

;iniitialize DS

MOV AX,@DATA
MOV DS,AX
 
; enter your code here
mov ah,1 ;single charecter as a input(1) output(2) string_output(9)

int 21h


;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
