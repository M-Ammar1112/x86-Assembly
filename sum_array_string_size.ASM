.model small
.stack 100h

.data
N equ 5             
A db 1, -2, 3, -4, 5    
Sum db 6 dup(0)     

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

    mov dl, al        

    mov al, dl         
    add al, 30h
    mov [Sum], al       

    mov al, dl          
    mov ah, 0          
    aam                  
    add ax, 3030h     
    mov byte ptr [Sum+1], ah    
    mov byte ptr [Sum+2], al     

    
    mov dx, offset Sum  
    mov ah, 9           
    int 21h            

    mov ax, 4C00h      
    int 21h

end 
