

;设置数据段
mov ax,0x07c0 
mov ds,ax 

;设置数据段偏移地址
mov ax,number 
mov bx,ax 


;设置分解数
mov ax,0x7c00
mov cx,5
mov si,10  

digit: 
    xor dx,dx  
    div si 
    mov [bx], dl 
    inc bx 
    loop digit  


mov ax,0xb800 
mov es,ax 
mov di,0 


mov cx,5
 
show:  
    ; xor bx,bx ;置零bx
    ; mov bx,(number -1 ) 
    ; add bx,cx   jns 无符号跳转指令

    dec bx 
    
    mov al,[bx] ;从后往前读取除过的余数
    add al,0x30 ;转ascll码
    
    mov [es:di],al 
    inc di 
    mov byte [es:di],0x07
    inc di 
    
    loop show 

    jmp $ 
    
number times 5 db 0  

times 510 - ($ - $$) db 1 
db  0x55,0xaa 

