
 
.STACK 100H

.DATA 
a db "goodbye$"

.CODE
MAIN PROC

;iniitialize DS
  
MOV AX,@DATA
MOV DS,AX
 
; enter your code here  
mov ah,1
int 21h 

mov dl,al 

mov ah,2
int 21h


mov ah,2
mov dl,0dh
int 21h
mov dl,0ah
int 21h

mov ah,1
int 21h 

;exit to DOS
               
MOV AX,4C00H
INT 21H

MAIN ENDP
    END MAIN
