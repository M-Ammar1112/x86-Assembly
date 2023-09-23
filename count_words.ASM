.model small
.stack 100h

.data
A db ' This is a test $'   
count dw 0               

.code
main proc
    mov ax, @data
    mov ds, ax

    mov si, offset A     

    mov cx, 0            

word_count:

    mov al, [si]         
    cmp al, ' '          
    je skip      

    cmp al, '$'          
    je end_word_count   

    inc si               
    cmp byte ptr [si-1], ' '    
    jne word_count      

incr:
    inc cx             
    jmp word_count     

skip:
    inc si              
    jmp word_count    

end_word_count:
    mov [count], cx      
    mov cx, [count]      

   
    mov dl, ' '        
    mov ah, 2          
    int 21h             

    mov dx, cx           
    call print_number    

    mov ax, 4C00h       
    int 21h

main endp


print_number proc
    push bx
    push cx
    push dx

    mov bx, 10       
    xor cx, cx          

    print_no:
    xor dx, dx         
    div bx              
    push dx             
    inc cx            

    or ax, ax            
    jnz print_no

    number_pop:
    pop dx               
    add dl, '0'        
    mov ah, 02h         
    int 21h             

    loop number_pop 

    pop dx
    pop cx
    pop bx
    ret
print_number endp

end main
