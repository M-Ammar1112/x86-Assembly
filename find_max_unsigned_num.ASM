.model small
.stack 100h

.data
N equ 10            
A db N dup(0)      

.code

    mov ax, @data
    mov ds, ax

    
    mov cx, N
    lea si, A
       
input:

    mov ah, 1        
    int 21h          
    mov [si], al     
    inc si
    loop input

    
    mov cx, N-1      
    mov si, offset A 

    mov di, si       
    add di, cx       
    mov al, [si]     

comparing:

    cmp al, [di]     
    jae skip    
    mov al, [di]     
    mov byte ptr [si], al   

skip:

    dec di           
    loop comparing

    
    mov al, [di]     
    mov [di], al     

    
    mov cx, N
    lea si, A 
       
print:

    mov dl, [si]     
    add dl, 30h      
    mov ah, 2        
    int 21h          
    inc si
    loop print

    mov ax, 4C00h    
    int 21h


end 
