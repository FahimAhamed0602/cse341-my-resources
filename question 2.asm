
.model small
.stack 100h

.data
    num1 db "User input "
    num2 db "reverse "

    num1 db ?
    num2 db ?
 
    reverse?

.code
main proc
    mov ax, @data
    mov ds, ax
    mov es, ax

  
    mov ah, 9
    lea dx, num1q
    int 21h

   
    mov ah, 1
    int 21h
    sub al, 48
    mov num1, al

  
    mov ah, 9
    lea dx, num2q
    int 21h

    
    mov ah, 1
    int 21h
    sub al, 48
    mov num2, al

    ; Perform division.
    mov al, num1
    mov bl, num2
    div bl
    mov divresult, al 
    mov remresult, ah 



    
    mov ah, 9
    lea dx, msg5
    int 21h

    
    mov al, remresult
    add al, 48
    mov dl, al
    mov ah, 2
    int 21h

    ; Exit program.
    mov ah, 4Ch
    int 21h

main endp
end main

