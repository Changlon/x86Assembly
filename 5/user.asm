;  @author  Changlon <changlong.a2@gmail.com>
;  @github  https://github.com/Changlon
;  @date    2022-02-01 21:15:18



;------------------------------------------------------------------------------- 
SECTION header vstart=0 
;用户程序头:

    
    ;程序的总字节长度
    program_length dd program_end 
    ;程序的入口地址
    code_entry  dw start  
                dd section.code.start 
    total_segment_len dw (segtbl_end - segtbl_start)/4
    
    ;定义各段的汇编地址 
    segtbl_start:
    code_segment dd section.code.start
    data_segment dd section.data.start 
    stack_segment dd section.stack.start 
    segtbl_end:                
;-------------------------------------------------------------------------------
SECTION code align=16 vstart=0 
    start:

          ;设置栈段
          mov ax,[stack_segment]  
          mov ss,ax 
          mov sp,stack_end 

         ;设置数据段
          mov ax,[data_segment]  
          mov ds,ax 
          mov bx,var_1

          mov ax,0xb800 
          mov es,ax  
          mov si,0 

         show:
          xor ax,ax 
          mov al,[bx] 
          cmp al,0 
          je waits

          mov byte [es:si],al  
          mov byte [es:si+1],0x07 
          add si,2 
          inc bx 
          jmp show



    waits: jmp $      
;-------------------------------------------------------------------------------
SECTION data align=16 vstart=0 
   var_1 db 'hello world',0    

;-------------------------------------------------------------------------------
SECTION stack align=16 vstart=0 
   resb 256
   stack_end: 
   
;-------------------------------------------------------------------------------
SECTION trail align=16 
program_end: 





