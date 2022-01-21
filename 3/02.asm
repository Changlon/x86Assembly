
mov ax,0xb800 
mov es,ax 



mov ax,12
mov bx,10 

cmp ax,bx 
je equal 
jl less
jmp  above

equal:  
    mov byte [es:0x00],'e'
    mov byte [es:0x01],0x07 
    jmp $

less:
    mov byte [es:0x00],'l'
    mov  byte [es:0x01],0x07 
    jmp $

above:
    mov byte [es:0x00],'a'
    mov byte [es:0x01],0x07 
    jmp $

times 510 - ($- $$) db 0 
db 0x55,0xaa 


; ja -> 无符号数 大于转移 | jg ->有符号 大于转移
; je
; jb -> 无符号小于比较|jl ->有符号小于跳转




