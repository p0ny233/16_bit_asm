; 编程0号 中断的处理程序
; div运算，但是结果的数据宽度太大，存不下引发中断
assume cs:code, ds:data

	code segment

		data segment
			db "divide error!"
		data ends

		start:


			;安装 中断程序 在 0000:0200H 内存中
			mov ax,cs
			mov ds,ax
			mov si,offset do0

			; ds:[si] 指向 do0 中断程序
			; es:[di] 指向 目标内存地址

			mov ax,0
			mov es,ax
			mov di,0200H


			mov cx,offset do0end - offset do0
			rep movsb

			; 设置中断向量
			mov word ptr es:[0 * 4],0200H
			mov word ptr es:[0 * 4 + 2],0

			; 触发中断
			mov ax,1000H
			mov bx,1H

			div bl ; 这里会产生 0 号中断

		do0:
			; 1. 显示字符串在显示器上

			; 1.1 初始化寄存器定位 字符串的位置
			mov ax,data
			mov ds,ax
			mov si,0

			; 初始化寄存器指向 显存
			mov ax, 0b800H
			mov es,ax
			mov di,190H
			mov cx,13



			; 这里的循环无法使用 rep 指令来代替，是因为字符属性限制了
			s:
				;循环读取
				mov ah,2H ; 高位是字符属性
				mov al,ds:[si]

				mov es:[di], ax
				inc si
				add di,2
			loop s 

			mov ax, 4c00h
			int 21h

		do0end: 
			nop
	code ends
	
end start