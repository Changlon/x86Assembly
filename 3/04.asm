 

;字母反向排列

jmp start 
string: 
    db 'changlon'
start:


;将db中的内容入栈

mov ax,0x7c0 
mov ds,ax 
mov si,string 


mov ax,cs
mov ss,ax 
mov sp,0 

mov cx, ( start - string ) 


xor ax,ax
e:  
mov al , [si]
push ax 
inc si 
loop  e

mov si,string 
mov cx, (start - string )
o: 
   pop ax 
   mov byte [si], al 
   inc si 
   loop o   

  jmp $ 

times 510 - ($ -$$ )    db 0 
db 0x55,0xaa 





;检测点
; aa55 and 
; fff0 
; aa50 
; data 0x50 , 0xaa 
; fff0 or 
; aa50 
; ax = fff0





