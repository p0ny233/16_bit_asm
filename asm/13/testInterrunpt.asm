;测试 中断过程

assume cs:code, ds:data
	data segment
		db"Interrupt!" ;10个字节
	data ends
	code segment
		start:

			mov ax,1111h
			mov ax,2222h
			mov ax,3333h

			; 安装程序
			mov cx,offset doInterruptEnd - offset doInterrupt
			mov ax,cs
			mov ds,ax
			mov si,offset doInterrupt

			mov ax ,0
			mov es,ax
			mov di,0200h
			cld
			rep movsb
			; 设置中断向量 ,除法溢出，中断码0号
			mov word ptr es:[2], 0
			mov word ptr es:[0], 0200h
			mov ax,1000H
			mov bx,1
			div bl





		doInterrupt:
			mov ax,0b800h
			mov es,ax
			mov di,0190h

			mov ax,data
			mov ds,ax
			mov si,0

			mov cx,10

			s:
				mov al,ds:[si]
				mov ah,2
				mov es:[di], ax
				inc si
				add di,2

			loop s

			iret
		doInterruptEnd: nop

			 
			mov ax,4c00h
			int 21h

	code ends
end start