;  @author  Changlon <changlong.a2@gmail.com>
;  @github  https://github.com/Changlon
;  @date    2022-02-14 18:29:57

;指令的组成 =  操作码 + ModR/M SIB 

; ModR/M字段的组成
; mod (7-6)                 reg/opcode (5-3)              r/m (2-0)  
; 11 -> [EAX/AX/AL..]       001 ->[cx/cl/ecx..]           000   -> mod 11 
;  88 11001000 -> 88c8
; mov al, cl 字节码 -> 88C8 
; 88 -> 为8位操作主码, c8是 ModR/M 一个字节


; SIB  字段组成

; 倍率 scal                 索引寄存器编号 index                    基址寄存器编号 base  
; add edx,[eax + ebx*2] 
; ADD r32 r/m32   
; 操作码 = 03  reg = 010   mod =  00  r/m 100  
; base = 000    index = 011     scal = 01  (2^scal)
; 03 0001 0100 0101 1000  
; 机器码 = 03 14 58  
















