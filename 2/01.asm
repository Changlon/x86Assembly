
code: jmp start


format: 
        db 0x07 
  text: 
        db 'c','h','a' ,'n','g' ,\
           'l','o','n' 

 
start:  

    mov ax,0x07c0
    mov ds,ax 

    mov ax,0xb800 
    mov es,ax 
    mov cx,(start - text ) 
    mov di,0 
    mov si,text 
    
  for:
    
    mov al,[si] 
    mov byte [es:di], al  
    add di,0x1 
    mov al,[format]
    mov byte [es:di],al 
    add si,0x1  
    
    loop for         ; 在调试的时候不会进行循环，直接跳转到下一个指令开始执行
    
    
end:
    times 510 - (end - code) db 0 
    db 0x55,0xaa 
     





















