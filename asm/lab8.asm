assume cs:code
	code segment
		mov ax, 4c00h
		int 21h
		
		start:	
			mov ax, 0
			s:
				nop
				nop
				mov di, offset s
				mov si,offset s2
				mov ax,cs:[si] ; 把 jmp 0018 的操作码送入ax
				mov cs:[di],ax ; 将 两个 nop 的操作码 替换成 jmp 0018 的操作码 
				; 两个标号的地址交换
			s0:
				jmp short s 
				; 跳到实际地址为 s2【错误】
				
			s1:
				mov ax,0
				int 21h
				mov ax,0
				
			s2:
				jmp short s1
				nop

	code ends
	end start
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	