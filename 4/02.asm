

section s1 
offset dw str1,str2,num ; str1 = 100 , str2 = 105 , num = 20 

section s2 align=16 VSTART=0X100 
str1 db 'hello' 
str2 db 'world' 

section s3 align=16 
num dw 0xbad 


