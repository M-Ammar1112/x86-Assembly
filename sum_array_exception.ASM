.model small
.stack 100h

.data
N equ 10             
A db N dup(0)       
Sum db 0            

.code

    mov ax, @data
    mov ds, ax

   
    mov cx, N
    lea si, A  
    
inpuT:

    mov ah, 1        
    int 21h          

    add [Sum], al    
    jo exc     

    inc si
    loop input

    
    mov dl, [Sum]     
    add dl, 30h       
    mov ah, 2         
    int 21h           

    mov ax, 4C00h     
    int 21h

exc:
   
   
    jmp $             


end
