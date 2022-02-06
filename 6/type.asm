;  @author  Changlon <changlong.a2@gmail.com>
;  @github  https://github.com/Changlon
;  @date    2022-02-04 18:01:34
;  编写一个输入字符显示光标的用户程序程序 


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
        ;   mov ax,[stack_segment]  
        ;   mov ss,ax 
        ;   mov sp,stack_end 

        ;  ;设置数据段
        ;   mov ax,[data_segment]  
        ;   mov ds,ax 
        ;   mov bx,var_1

        mov ax,0xb800 
        mov es,ax  
        mov si,0 
        
keybord_listener:
        xor ax,ax 
        int 0x16 
        call put_char  
        jmp keybord_listener 
        
put_char: 

        cmp al, 0x08  
        jz .back_space
        cmp al, 0x0d 
        jz .enter_space 
        
        .common_char:
            mov byte [es:si],al 
            mov byte [es:si+1],0x07 
            add si,2 
            call get_cursor     
            inc bx 
            call set_cursor  
            jmp .return 
            
        .back_space:
            call get_cursor 
            cmp bx,0 
            jz .return 
            mov byte [es:si-2],0 
            sub si,2 
            sub bx,1 
            call set_cursor  
            jmp  .return 

        .enter_space: 
            call get_cursor  
            mov ax , bx 
            mov bl ,80 
            div bl 
            mul bl 
            add ax,80 
            mov bx ,ax 
            call set_cursor 
            shl bx,1 
            mov si,bx 
            jmp .return 


        .return ret  


get_cursor:  ;获取光标位置 ->bx 
         push ax 
         push dx  
         xor bx,bx 
         
         mov dx,0x3d4
         mov al,0x0e
         out dx,al
         mov dx,0x3d5
         in al,dx                        ;高8位 
         mov ah,al

         mov dx,0x3d4
         mov al,0x0f
         out dx,al
         mov dx,0x3d5
         in al,dx                        ;低8位 
         
         mov bx,ax                       ;BX=代表光标位置的16位数

         pop dx 
         pop ax 
         ret 

set_cursor: ; 设置光标位置 ; bx -> 端口
         push ax
         push dx 
         
         mov dx,0x3d4
         mov al,0x0e
         out dx,al 

         mov dx,0x3d5
         mov al,bh
         out dx,al

         mov dx,0x3d4
         mov al,0x0f
         out dx,al 

         mov dx,0x3d5
         mov al,bl
         out dx,al 

         pop dx 
         pop ax 
         ret 
         
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
