; 检测点 10.5.2 ，下面的程序执行后，ax 和 bx 中的数值为多少？
assume cs:code
	data segment
		dw 8 dup (0)
	data ends
	
	code segment
		start:
			mov ax,data
			mov ss,ax
			mov sp,10h
			mov word ptr ss:[0], offset s
			mov ss:[2], cs
			call dword ptr ss:[0]
			nop
			s:
				mov ax,offset s
				sub ax,ss:[0cH]
				mov bx,cs
				sub bx,ss:[0eH]
				mov ax, 4c00h
				int 21h
				
	code ends
end start