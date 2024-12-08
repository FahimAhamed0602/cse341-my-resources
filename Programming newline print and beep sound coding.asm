.model small
.stack 100h
.code

main proc 
    ;data input
    mov ah,1
    int 21h
    mov bl,al
    
    ;New line 
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    ;Another data  input
    mov ah,1
    int 21h
    mov dl,13 
          
          
    ;Another New line      
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h 
    
    ;output
    mov ah,2
    mov dl,bh
    int 21h  

    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    mov ah,2
    mov dl,bh
    int 21h 
    
    
    mov ah,2
    mov dl,07
    int 21h
            
    exit:
    mov ah,4ch
    int 21h
    main endp
end main
    
  