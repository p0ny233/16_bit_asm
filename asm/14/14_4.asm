; 在屏幕中间显示当前的月份
; 读取 CMOS RAM 中的时间信息，是以 BCD 码 存放的，读出来的时候需要将其右移4位


assume cs:code
	code segment
		start:

			mov ax,0b800h
			mov es,ax
			mov di,2500



			mov al,8
			out 70h,al
			in al,71h
			mov ah,al
			mov cl,4
			shr ah,cl

			; +30h 刚好是 数字的ascii码
			add ah,30h
			add al,30h
			
			mov es:[di], ah ; 显示月份的十位
			add di,2
			mov es:[di], al ; 显示月份的个位

			mov ax,4c00h
			int 21h


	code ends

end start
