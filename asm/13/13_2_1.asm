; 编写供应用程序调用的中断例程
; 编写、安装 7ch 的中断例程
; 功能：求一 word 型数据的平方
; 参数：(ax) = 要计算的数据
; 返回值：dx、ax 中存放结果的高16位和低16位
; 应用举例： 求 2 * 3456^2

assume cs:code
	code segment
		start:
			mov ax,3456
			mov bx,cs
			mov ds,bx
			mov si,offset do7c
			mov es,di
			mov di,200h
			CLD ; DF  复位
			mov cx,offset do7cend - offset do7c
			rep movsb
			; 安装程序

			; 设置中断向量
			mov word ptr es:[4 * 7ch], 200H
			mov word ptr es:[4 * 7ch + 2], 0H

			int 7ch

			mov ax,4c00h
			int 21h



			; 编写 7ch中断程序
			do7c:
				mul ax
				; 得到 平方的结果，平方的结果还需要去乘以2
				mov bx,dx
				mov cx,2

				mul cx
				add bx,dx ; 只需要高位的结果和低位的进位相加的即可
				mov si,ax
				
				; 高位乘法
				mov ax,bx
				mul cx
				mov dx,ax
				mov ax,si
				iret

			do7cend:nop

	code ends

end start

