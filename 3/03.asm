

;计算1..100的累加
;栈的使用

jmp start 

stack:

times 16 db 0 

start: 

mov ax,0xb800 
mov es,ax 


mov ax,0x7c0

mov ss,ax 

mov ax, start 
mov sp,ax 

mov di,0 


xor ax,ax 
mov cx,1

lj:
add ax,cx 
inc cx
cmp cx,100 
jle lj 



push  0x7c
push  0x7d 

pop  ax
pop  ax 

jmp $ 



times 510-($ - $$) db 0 

db 0x55,0xaa 












