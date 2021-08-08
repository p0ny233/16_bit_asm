; 编程：处理0号中断
; 处理0号中断程序：将 字符串 显示在屏幕上
assume cs:code, ds:data

	data segment
		db "overflow!"
	data ends
	code segment
		start:
			; 将 do0 程序的代码送入 0000：0200 处
			mov ax, cs
			mov ds,ax
			
			;mov ax,do0
			;mov si,ax
			; 以上两行可以更改为如下一行：
			mov si, offset do0

			mov ax,0
			mov es,ax
			mov di,0200H  ; 0000 : 0200
			mov es:[0],di ; 偏移地址
			mov es:[2],ax


			

			; 以上初始化 各个寄存器的指向

			mov cx, offset do0ends - offset do0
			rep movsb ; DF 标志位为0  ，从低到高
			mov ax,1000H
			mov bx,190H

			div bl


			;设置 中断向量
			


		do0:
			; 显示字符串 "overflow!"， 写到显存
			; 一行 80 个字符，一行 160个字节

			mov bx,0b800H
			mov es,bx
			mov di,0190H ; 设置写的

			mov bx,data
			mov ds,bx
			mov si,0

			mov cx,9
				s:
					mov al,ds:[si]
					mov ah,00000010B
					mov es:[di] , ax

					inc si
					add di,2
				loop s

			

			mov ax,4c00h
			int 21H
		do0ends:

	code ends


end start
			