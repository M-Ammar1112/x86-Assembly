.model small
.stack 100h

.data
num dw 65535    

.code
    mov ax, @data
    mov ds, ax

    mov ax, num     
    mov bx, 10      

    mov cx, 0       

next:
    xor dx, dx      
    div bx          
    add dx, 30h     
    push dx         
    inc cx          
    test ax, ax     
    jnz next 

sof:
    cmp cx, 0       
    jz exit         
    pop dx          
    mov ah, 2       
    int 21h         
    dec cx          
    jmp sof 

exit:
    mov ax, 4C00h   
    int 21h


end 
