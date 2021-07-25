assume cs:code
	code segment
		start:
			; 若当作 有符号运算，OF=1 表示溢出， CF=0
			; 若当作 无符号运算，OF=1 无意义， CF=0 未溢出

			mov al,7FH
			add al,2H

			mov ax,4c00h
			int 21h

	code ends
end start

