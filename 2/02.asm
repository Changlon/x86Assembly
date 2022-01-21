 


code:

    jmp start 

    text: 

        db 'c',0x07,'h',0x07,'a',0x07,'n',0x07,'g',0x07,'l',0x07,'o',0x07,'n',0x07 
        
    start: 
        
        mov ax,0x07c0 
        mov ds,ax 

        mov ax,0xb800 
        mov es,ax 
         
        mov cx, ( start- text )  / 2  
        mov si , text 
        mov di , 0x0 
        
        cld ; 正向输出

        rep movsw 
        jmp start ; jmp $
        

end_code:

times 510 - (end_code - code ) db 0 ; times  510 -  ( $ - $$) db 0  --> $当前行汇编地址,$$程序段的汇编地址
db 0x55 , 0xaa 







