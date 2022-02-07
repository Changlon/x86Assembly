# x86Assembly
x86从实模式到保护模式代码练习


### nasm 编译命令
```
nasm -f bin 02.asm -o D:\OS\02.bin 
nasm 02.asm -l 02.lst   //   生成列表文件
``` 


### bochs 调试命令

```

sreg // 查看所有寄存器
r //显示通用寄存器
s //单步调试
b 0x0000:0x7c00 //断点
c 执行到断点处
xp /512xb 0x7c00 //查看内存 /字节数(x以16进制显示,b字节为单位 ,地址)
n  // 单步调试 
u/16 反汇编16条指令
info eflags //显示标志寄存器的信息 df小写 0 大写 1
print-stack //打印栈的地址
creg //显示控制寄存器的内容 如 cr0 ->控制进入保护模式
info gdt // 查看gdt表
```





