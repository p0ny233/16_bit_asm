; 将十进制显示在 显存中

assume cs:code 
	data segment
		dw 12666
	data ends
	
	code segment
		start:
			mov ax,data
			mov ds,ax
			mov si,0

			mov ax,ds:[si]
			mov bx,0b800h
			mov es,bx
			mov di ,120
			call dtoc

			mov ax, 4c00h
			int 21h

			dtoc:
				;源数据在 ax 中
				mov cx,10
				div cx ; dx = 余数，ax =  商

				add dl,30H
				mov es:[di],dl
				mov byte word ptr es:[di+1],2H
				sub di ,2

				mov cx,ax
				jcxz over_dtoc
				; div 指令 
				; 8位除数 ，默认的16位被除数存放在AX中
				; 16 位 除数，被除数的高16位存放在 DX中， 被除数的低16位存放在AX中
				; 8位除数的商存放在 AL 中， 余数存放在 AH中
				; 16 位除数的商存放在 AX 中， 余数存放在 DX 中

				; 12666 / 10  的除数可以使用 ax
				mov dx,0
				jmp dtoc		

			over_dtoc:
				ret	
	code ends
end start
