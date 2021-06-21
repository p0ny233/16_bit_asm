assume cs:code, ds:data
; 编程 ，修改内存中 过时的数据
; 修改 排名，收入，著名产品字段
	data segment
		db 'DEC' ; 公司的名称
		db 'Ken Olsen' ; 总裁姓名
		dw 137 ; 排名  >> 38
		dw 40; 收入  >> 增加70
		db 'PDP' ; 著名产品  >> VAX
		
	data ends
	
	code segment
		;初始化数据段
		start:
			mov ax, data
			mov ds, ax
			
			mov bx,10h
			mov si,0
			
			mov word ptr ds:[12],  38
			add word ptr ds:[14], 70
			
			; 修改 产品字段
			mov byte ptr ds:[bx+si],'V'
			inc si
			mov byte ptr ds:[bx+si],'A'
			inc si

			mov byte ptr ds:[bx+si],'X'
			
			
			mov ax, 4c00h
			int 21h
	code ends
	
	
	end start
	