; string 
.model small
.code
main proc
    mov cx,0
    
    pushin:
        mov ah,1
        int 21h
        mov bl,al
        
        cmp bl,0dh
        je newline
        push bx
        inc cx
        jmp pushin
        
     newline:
        mov ah,2
        mov dl,0dh
        mov dl,0ah
        int 21h 
        
     popout:
        pop dx
        int 21h
        loop popout
        
        main endp
end main
        
        

