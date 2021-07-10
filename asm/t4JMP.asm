assume cs:code
	code segment
		s:
			mov ax,1234h  ; 占用三个字节
			db 123 dup (0)
			start:
				jmp short s  ; 这条指令占用两个字节
				
				; 只能设置 127 个字节，向后转移 127个字节
					db 127 dup (0)
				s1:
					mov ax,1234h
					
				
	code ends
	
	end start
	

