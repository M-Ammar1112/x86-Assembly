.model small
.stack 100H

.data
A db 'This is a test $'
B db 100 dup('$')

.code
main proc
mov ax, @data
mov ds, ax

mov si, offset A    
mov di, offset B    

copy_string:
mov al, [si]       
mov [di], al       

cmp al, '$'        
je end_copy        

inc si             
inc di             
jmp copy_string    

end_copy:
    

mov ax, 4C00h      
int 21h
main endp

end main
