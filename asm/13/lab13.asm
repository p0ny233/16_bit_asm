; 编写并安装 int 7ch 中断例程，功能为 显示一个用0 结束的字符串
; 中断例程安装在 0:200 处
; 参数：(dh)= 行号 ，(dl)= 列号， (cl)= 颜色，ds:si 指向字符串首地址

assume cs:code , ds:data
	data segment
		db "Welcome to masm !",0 ; 将 0 放进双引号中。表示 字符0 ，字符0 的ascii码是32，十六进制20
	data ends
	code segment
		start:
			; 1、安装中断程序
			mov ax,cs
			mov ds,ax
			mov si,offset do7ch
			mov ax,0
			mov es,ax
			mov di, 200h
			cld
			mov cx, offset do7cend - offset do7ch
			rep movsb

			; 2、设置中断向量表
			mov word ptr es:[7ch * 4 + 2],0
			mov word ptr es:[7ch * 4],200h

			; 3、传递参数值
			mov dh,5
			mov dl,12
			mov ch,0

			mov cl,02h
			mov ax,data
			mov ds,ax
			mov si,0

			; 4、 调用中断
			int 7ch
			mov ax,4c00h
			int 21h




		do7ch:

			mov ax,0b800h
			mov es,ax
			mov ax,0A0h
			mul dh
			
			mov di,ax
			mov ax,2
			mul dl
			add di,ax


			mov bl,cl
			s:
				mov ch,0
				mov cl,ds:[si]
				jcxz do7cret
				mov ch,bl
				mov es:[di],cx
				add di,2
				inc si

				jmp s


		do7cret:
			iret

		do7cend:
			nop


	code ends
end start