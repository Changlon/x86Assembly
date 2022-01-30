;过程调用

section data1 align=16 VSTART=0;定义一个段 16字节对齐
mydata dw 0xFFFF

section data2 align=16 VSTART=0 
string db 'hello'

section code align=16  VSTART=0 
        mov bx,mydata 
        mov si,string 
        



