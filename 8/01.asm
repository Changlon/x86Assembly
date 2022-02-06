; x86- 80386  新增段寄存器 fs,gs 
; 32位地址线 可以用 一个32位寄存器来访问地址空间 ffff ffff 

mov eax , 0xf0000000 ; 机器指令 66b8
mov ax ,  0x1111 ; b8 
add eax , 0xcccc 










