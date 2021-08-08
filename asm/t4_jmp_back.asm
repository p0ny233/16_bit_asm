; jmp short 标号
;	 	最多 向后转移 127 个字节

; 标号的地址 减去 jmp指令后的 第一个字节 = 偏移量 

assume cs:code
	code segment
		start:
			;jmp short s1  ; 这条指令占用两个字节
			jmp far ptr s1  ; 这条指令占用两个字节
	
		; 只能设置 127 个字节，向后转移 127个字节
			db 300 dup (0)
		s1:
			mov ax,1234h
		
	code ends
end start

;	076A:0000	EB7F	JMP	   0081

; 标号的地址 = 0081
; 位移量：7F
; jmp指令后的 第一个字节的地址：0000 + jmp指令的长度 =  0000 + 2 = 0002
; 标号的地址 减去 jmp指令后的 第一个字节 = 偏移量 
;  0081	      -    0002  				 =   7F


