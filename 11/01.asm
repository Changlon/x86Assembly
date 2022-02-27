;  @author  Changlon <changlong.a2@gmail.com>
;  @github  https://github.com/Changlon
;  @date    2022-02-22 15:31:01
;  保护模式程序的动态加载和执行 

; 主扇区加载程序 (进入保护模式加载内核)-> 内核 (@1) -> 用户程序 ----
;                                         ^             |  
;                                         |-------------|  
;  
;  @1
;  内核加载用户程序:  1. 内核分配内存               2. 读磁盘程序到指定内存处
;                    3. 建立用户程序头部段描述符,并安装新描述符生成选择子 
;                    4. 修改用户头部，将选择子填写到对应的段描述中
;                    5. 用户程序使用段选择子来访问，读写内存 
;                    6. 控制权交给用户程序的关键代码
;                       ...
;                       mov ds ,ax 
;                       call far [0x08] :                     
;                       使用用户头部段选择子，访问 偏移量0x08位置
;                       取出32 数据赋值给eip,再取出 16位数据作为cs的段选择子 
;                       保护模式执行用户程序
;                     7. 执行完用户程序后 恢复内核的数据段,栈段, esp等
;                         清除用户程序描述符






;   字节交换指令 bswap r 
;   举例 bswap 1011 0000 0001 1010 
;   变成 1010 0001 0000  1011 


; cpuid 指令: 取得处理器品牌信息并显示 
; eflags 21位 0 表示cpu不支持此指令,反之则支持   



; 条件传送指令 cmov... r (16/32/64) , r / m 
; 若 eax 和edx 的值不同，则将edx 的值传送到eax 
; cmp eax , edx 
; cmovne eax,edx 
; cpu 是否支持? mov eax, 1    cpuid  edx 位15 为 1 支持


; test 指令: Test命令将两个操作数进行逻辑与运算，并根据运算结果设置相关的标志位。但是，Test命令的两个操作数不会被改变。运算结果在设置过相关标记位后会被丢弃。
; 语法：TEST r/m,r/m/data 
 
; sgdt m/6   save gdt  (global descriptor table)  保存gdt 

; movzx   r16/32/64  r8/16 |  m8/16    扩充并传送
; movzx ax ,dl (5A)  005A -> ax 
; movzx ebx,dl (5B)  0000005B -> ebx 


; movsx ax ,cl (08) 00001000 -> 符号位扩展 ( 0008 ) 00000000 00001000 -> ax 
; movsx ebx,dl (92) 10010010 -> (ffff ff92) -> ebx 

