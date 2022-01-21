

start:
 ; 65535 / 10 = 6553 ... 5 
 xor dx,dx ;异或 相同 0 不同 1
 mov ax, 0xffff 
 mov bx, 0xa 
 div bx 
 add dl , 0x30  ;数字字符   
 mov cx,0
 mov ds,cx 
 mov [0x7c00 + buffer] , dl
 
 xor dx,dx 
 div bx 
 add dl , 0x30 
 mov [0x7c00 + buffer + 1] , dl 

 xor dx,dx 
 div bx 
 add dl , 0x30 
 mov [0x7c00 + buffer + 2] , dl  

 xor dx,dx 
 div bx 
 add dl , 0x30 
 mov [0x7c00 + buffer + 3] , dl  

 xor dx,dx 
 div bx 
 add dl , 0x30 
 mov [0x7c00 + buffer + 4] , dl  

 
 mov cx , 0xb800 
 mov es , cx 

 mov  al , [0x7c00 + buffer + 4]
 mov [es:0x00] , al 
 mov byte [es:0x01] , 0x2f 
 
 mov  al , [0x7c00 + buffer + 3]
 mov [es:0x02] , al 
 mov byte [es:0x03] , 0x2f  

 mov  al , [0x7c00 + buffer + 2]
 mov [es:0x04] , al 
 mov byte [es:0x05] , 0x2f  

 mov  al , [0x7c00 + buffer + 1]
 mov [es:0x06] , al 
 mov byte [es:0x07] , 0x2f  

 mov  al , [0x7c00 + buffer ]
 mov [es:0x08] , al 
 mov byte [es:0x09] , 0x2f  

again: 
    jmp again 
    
buffer:  db 0,0,0,0,0   
 
end: 

times 510 - (end - start) db 0 
db 0x55 ,0xaa 







