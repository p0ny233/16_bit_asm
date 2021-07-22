assume cs:code
	code segment
		start:
			mov al,7FH
			add al,2H

			mov ax,4c00h
			int 21h

			; 无符号 ，不溢出 CF = 0
			; 有符号 ， OF = 1 

	code ends
end start

