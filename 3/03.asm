

;计算1..100的累加
;栈的使用

mov ax,0xb800 
mov es,ax 
mov di,0 

xor cx,cx 
mov ss,cx 
mov sp,cx 





xor ax,ax 
mov cx,1

lj:
add ax,cx 
inc cx
cmp cx,100 
jle lj 


xor cx,cx  
mov si,10 
dp:  
inc cx 
xor dx,dx  
div si 
add dl,30h 
push dx 
cmp ax,0 
jne dp 


show:   
pop dx 
mov [es:di],dl  
inc di 
mov byte [es:di],0x07  
inc di 
loop show 

jmp $ 

times 510-($ - $$) db 0 

db 0x55,0xaa 












