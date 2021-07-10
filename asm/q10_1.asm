; 问题 10.1 ，下面程序返回前，bx中的值是什么？
assume cs:code 
	code segment
		start:
			mov ax,1
			mov cx,3
			call s
			mov bx,ax
			mov ax,4c00h
			int 21h
			s:
				add ax,ax
				loop s
				ret
	code ends
end start