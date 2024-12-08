.model small
.stack 100h
.data
a db 'Hello, World!$'  ; Define message with '$' as end delimiter

.code
main proc  
        mov ax, @data
        mov ds, ax  ; Initializing data segment
    
        ; Print message 'Hello, World!'
        mov ah, 9
        lea dx, a
        int 21h
    
        ; Newline for formatting
        mov ah, 2
        mov dl, 13  ; Carriage return
        int 21h
        mov dl, 10  ; Line feed
        int 21h
    
        ; Loop to print A to Z
        mov cx, 26       ; Prepare for 26 iterations
        mov ah, 2        ; Function to print character
        mov dl, 'A'      ; Start from character 'A'
        
    level1:
        int 21h          ; Print current character in DL
        inc dl           ; Move to the next character
        loop level1      ; Repeat until CX = 0
    
        ; Exit program
        mov ah, 4Ch
        int 21h 
    
    main endp
    end main
