; x86- 80386  新增段寄存器 fs,gs 16位 
; 32位地址线 可以用 一个32位寄存器来访问地址空间 ffff ffff 

mov eax , 0xf0000000 ; 机器指令 66b8
mov ax ,  0x1111 ; b8 
add eax , 0xcccc 


; GTDR 全局描述符表寄存器 
; 32 位 (基地址)+ 16 位 (边界)
; 全局描述符表线性基地址 + 全局描述符表边界
 


;lgdt m48  ->  gdt界限值地址(描述表界限总字节数 - 1 ) gdt线性地址 该指令设置GTDR; 加载6个字节




; 描述符 G位 23 
; 0 
; 1  实际使用的段界限 = 描述符中的段界限 * 0x1000 * 0xfff 
; 举例 描述符中的界限值是0 ,G位是1 则实际使用的界限 = 0 * 0x1000 + 0xfff = 0xfff 
; 段向上扩展，段内偏移范围是 0 ~ 0xfff 
; 段向下扩展，段内偏移量是 0xffff/0xffffffff ~ 0xfff  此时段访问小于0xfff 则出现异常中断

; D/B 位22 
;相对于代码段 默认操作尺寸大小 0 16位操作尺寸 1 32位操作尺寸
;位相对于数据段 0 代表16位偏移量  1 代表32位偏移量
; 0 -> 段按照16位操作
; 1 -> 按照32位进行操作

; X位 11  表示是否可以执行， x= 0代表数据段不可执行，x= 1表示可执行
; S位 12  指定描述符类型， 0 为系统段， 1 表示代码段或者数据段
; P位 15  表示段是否存在位， 1 存在  0 不存在
; DPL 位 13-14 表示特权级 0-3 
; E 位 10 当 X位 = 0 时, 指示段的扩展方向, 0 向上扩展， 1 向下扩展 
; C 位 10 当X位 = 1 时 指示段是否位特权级依从的 0 表示 非依从的代码，代码段可以从与它特权级相同的代码段调用
; 1 表示允许从特权级低的程序转移到该段执行



mov al , 0000_0000b  ; 二进制写入方式

; 寄存器cr0 位0 pe ->开启保护模式 1->保护模式 
 
;段选择子 ds ,fs,ss ... 

; 3-15 位是描述符索引 2^13 = 8192 
; 2 位 TI 0表示选中全局gdt表索引 1表示 使用 idt表索引
; 0-1位 RPL 寄存器特权级

; !!!! 保护模式下的段寄存器(访问内存)工作方式
; 1. 当修改了段选择子（段寄存器）, 会去描述符表找对应的描述符，将内容存入处理器中的描述符高速缓存器 
; 2. 以缓存器中的 线性基地址 + 段内偏移来访问内存
 