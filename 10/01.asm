;  @author  Changlon <changlong.a2@gmail.com>
;  @github  https://github.com/Changlon
;  @date    2022-02-19 00:43:26
;  存储器的保护 

; 1. mov bs,eax 等价于 mov bs,ax 
; 2. 描述符 P位为0时 段不存在物理内存中，处理器终止处理,引发 11号异常中断 , 将段数据调入内存,
; p位置1,返回到引起中断的那条指令。 
; 3. cs 寄存器只允许加载代码段描述符, DS,ES,FS,GS 选择器可加载数值为0的选择子
;   但是 mov [ebx] ,ax 访问内存时会导致异常中断,cs,ss 选择器不允许传送 0 选择子 
; 4. G= 0 实际使用的段界限 = 描述符中的界限值
;    G =1 实际使用的段界限 = 描述符中的界限值 x 0x1000 + 0xfff
; 低 0x7c00fffe
; 高 0x00cf9600
; 段界限 = ffffe x 0x1000 + 0xfff = ffffefff


; 数据段保护（向上扩展）: 操作数有效地址 + 操作数大小 - 1 <= 实际使用的段界限 
; (向下保护)     操作数的有效地址 > 实际使用的段界限
; 内存线性地址的回绕特性 ： 16位偏移地址 0 -ffff 64k  
;                           当段基地址为 ffffff00 时 偏移最多 ff 就回绕至 00000000
; 向下扩展的段作为栈段 : 图向下....png

; 别名实现段共用共享：创建一个和代码段一样的数据段描述符，用来访问代码段中定义的数据 

; 指令 xchg r/m,r/m 交换内容,不能同时为内存地址
; 用法:
; xchg al,dh 
; xchg ecx,edx 
; xchg cx,[0x7e00]

; 指令 jge 大于等于则跳转  

















