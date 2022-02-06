;  @author  Changlon <changlong.a2@gmail.com>
;  @github  https://github.com/Changlon
;  @date    2022-02-05 15:33:03



; IF 中断标志位，1 ->接受 INTER 中断信号
; cli ->清除IF -> 0 
; sti -> 设置IF -> 1
; iret -> pop :  ip ,cs ,flags 
 
; test r/m , r/imm  相当于and 但不保存结果,影响 zf,sf,pf 
; test al, 0000 1000b 测试al 位3 从而影响 zf 
; not r/m 求反指令
; hlt 使cpu 进入睡眠状态




  