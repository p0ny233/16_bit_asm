; 测试 执行 sub指令时，观察标志寄存器的值

assume cs:code
	code segment
		start:
			mov ax,2
			mov bx,1
			sub bx,ax
			adc ax,
			
	code ends

end start