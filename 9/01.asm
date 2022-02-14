;  @author  Changlon <changlong.a2@gmail.com>
;  @github  https://github.com/Changlon
;  @date    2022-02-14 18:29:57


; ModR/M字段的组成
; mod (7-6)                 reg/opcode (5-3)              r/m (2-0)  
; 11 -> [EAX/AX/AL..]       001 ->[cx/cl/ecx..]           000   -> mod 11 
;  88 11001000 -> 88c8
; mov al, cl 字节码 -> 88C8 
; 88 -> 为8位操作主码, c8是 ModR/M 一个字节
; 



