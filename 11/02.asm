;  @author  Changlon <changlong.a2@gmail.com>
;  @github  https://github.com/Changlon
;  @date    2022-02-22 15:31:01
;  保护模式程序的动态加载和执行 

; 主扇区加载程序 (进入保护模式加载内核)-> 内核 -> 用户程序 ----
;                                         ^             |  
;                                         |-------------|  


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


















