.model  small
.stack   100h
.data
num  dw  65535
.code
mov	ax,	@data
mov	ds,	ax

mov	ax,	num
mov	bx,	10

mov	cx,	0
	
cmp ax,0 
jg next
neg ax

next:
	
mov dx,0
div	bx
add	dx,	30h
push dx
inc	cx
cmp	ax,	0
jne	next
	
	
sof:

cmp cx,0
jz  ext
pop	dx
mov	ah,2
int	21h
dec	cx
jmp sof
ext:
	.exit
end
	
	

