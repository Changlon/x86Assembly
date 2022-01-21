; div  除法指令
; div 寄存器 | 内存地址 
; 8 位 商 -> al ; 余数 -> ah 
; 16位 商 -> ax ; 余数 -> dx 
; 32位 商 -> eax ; 余数 -> edx 
; 64位 商 -> rax ; 余数 -> rdx 
; div byte [0x2002] | div bh
; div bx | div word [0x2002]
; div ebx | div dword [0x2002] 
; div rbx | div qword [0x2002] 
; 计算378 / 37 

start:

mov ax,378 

mov bl,37 

div bl

end_start:

times 510 - (end_start - start) db 0 

db 0x55
db 0xaa 



