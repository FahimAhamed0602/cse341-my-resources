.MODEL SMALL
.STACK 100H
.DATA 
string_one db "User Input: $" 
string_two db "Output: Maximum number is: $" 
a db ?
b db ?
c db ?
.CODE
MAIN PROC
;iniitialize DS
MOV AX,@DATA
MOV DS,AX
; enter your code here 
mov ah,9
lea dx, string_one
int 21h
; first input
mov ah,1
int 21h
sub al,30h ; sub al,48d  
mov a,al 
;space
mov ah,2
mov dl,0
int 21h
;second input
mov ah,1
int 21h
sub al,30h ; sub al,48d  
mov b,al
;space
mov ah,2
mov dl,0
int 21h
;third input
mov ah,1
int 21h
sub al,30h ; sub al,48d  
mov c,al  
;a>b true a>c false c true a
;a>b false b>c false c else b 
; maximum number should be calculated by you
;new line
mov ah,2
mov dl,0Ah
int 21h
;carriage return
mov dl, 0Dh 
int 21h
 
 
mov ah,9
lea dx, string_two
int 21h 

mov ah,2
mov dl,c
add dl,30h
int 21h


 


;exit to DOS              
;MOV AX,4C00H
;INT 21H
exit:  
MAIN ENDP
    END MAIN
