; 补全程序，实现从内存 1000:0000 处执行程序
assume cs:code 
	stack segment
		db 16 dup (0)
	stack ends

	code segment
		start:
			mov ax,stack
			mov ss,ax
			mov sp,10h
			
			mov ax,1000h
			push ax
			
			mov ax,0
			push bx
			
			retf ; 从栈中弹出 双字 32位
			
			
	code ends
end start
