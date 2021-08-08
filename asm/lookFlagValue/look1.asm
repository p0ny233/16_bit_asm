; 查看标志位全 0时候 的值
assume cs:code, ss:stack

	stack segment
		db 32 dup(0)
	stack ends
	code segment
		start:
			mov ax,stack
			mov ss,ax
			mov sp,20H

			mov ax,1
			mov bx,2
			
			;测试将 PF 位 置为 1 
			add ax,bx

			pushf ; 执行这里之后查看 栈中内容
			mov ax,1111H

			push ax ; 为了更清楚看出栈中的内容




			mov ax, 4c00h
			int 21h
	code ends

end start