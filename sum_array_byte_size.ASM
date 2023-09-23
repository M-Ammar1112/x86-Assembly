.model small
.stack 100h

.data
N equ 5             
A db 1, -2, 3, -4, 5   
Sum db 0            

.code

    mov ax, @data
    mov ds, ax

    mov si, offset A    
    mov cx, N          
    mov al, 0           

summing:
    add al, [si]        
    inc si             
    loop summing     

    mov [Sum], al      

   
    mov dl, [Sum]      
    add dl, 30h         
    mov ah, 2           
    int 21h            

    mov ax, 4C00h      
    int 21h


end 
