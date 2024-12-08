
 
.STACK 100H

.DATA 
a db "goodbye$"

.CODE
MAIN PROC

;iniitialize DS
  
MOV AX,@DATA
MOV DS,AX
 
; enter your code here  
LEA DX,a ; Load effective address

mov ah,9
int 21h

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
