 
;  @author  Changlon <changlong.a2@gmail.com>
;  @github  https://github.com/Changlon
;  @date    2022-01-30 23:46:08
;  in al/ax,dx/imm 读端口命令
;  out dx/imm8,al/ax 写端口
;  adc带进位的加法指令
;  shr r/m,imm8 逻辑右移  - shl
;  ror r/m ,imm8 循环右移，右边被挤出来的送入左端 - rol 
; jmp short 段内一个字节的转移
; jmp near  段内一个字的转移
; jmp r/m  
; jmp 0xffff;0xffff =>修改cs,ip
; jmp far m => 两个字
; rebs | resw | resd imm 保留空间



  app_lba_start equ 100 
  section mbr align=16 VSTART=0x7c00   

  
