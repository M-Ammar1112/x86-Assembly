.model small
.stack 100h

.data
N1 equ 5             
N2 equ 5             
N3 equ N1+N2         
A db 1, 3, 5, 7, 9    
B db 2, 4, 6, 8, 10
  
C db N3 dup(0)       

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset A  
    mov di, offset B   
    mov bx, offset C   

    mov cx, N1         
    mov dx, N2         

merging_array:
    cmp cx, 0          
    je copy_rem_b  

    cmp dx, 0          
    je copy_rem_a  

    mov al, [si]       
    mov bl, [di]       

    cmp al, bl         
    jle copy_a         
    jmp copy_b         

copy_a:
    mov [bx], al       
    inc si             
    dec cx             
    jmp consecutive_iteration  

copy_b:
    mov [bx], bl       
    inc di             
    dec dx             
    jmp consecutive_iteration  

copy_rem_a:
    mov al, [si]       
    mov [bx], al
    inc si
    jmp consecutive_iteration

copy_rem_b:
    mov al, [di]       
    mov [bx], al
    inc di
    jmp consecutive_iteration

consecutive_iteration:
    inc bx             
    loop merging_array    

    
    mov si, offset A
    mov cx, N1
    call print_array

    mov si, offset B
    mov cx, N2
    call print_array

    mov si, offset C
    mov cx, N3
    call print_array

    mov ax, 4C00h      
    int 21h
main endp

print_array proc
    mov dl, '['        
    mov ah, 2          
    int 21h            

print:
    mov al, [si]       

    mov dl, [si]       
    add dl, 30h        
    mov ah, 2          
    int 21h            

    inc si             
    loop print    

    mov dl, ']'        
    mov ah, 2          
    int 21h            

    mov dl, ','        
    mov ah, 2          
    int 21h            

    ret
print_array endp

end main

