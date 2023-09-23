.model small
.stack 100H

.data
A db 'This is a test $'
B db 100 dup('$')

.code

mov ax, @data
mov ds, ax



mov si, offset A
mov cx, 0  
     
space_count:

    mov al, [si]    
    cmp al, '$'     
    je count_end   

    cmp al, ' '     
    je incr   

    inc si          
    jmp space_count

incr:
    inc cx          
    inc si          
    jmp space_count

count_end:
    mov ax, 4C00h   
    int 21h


end 
