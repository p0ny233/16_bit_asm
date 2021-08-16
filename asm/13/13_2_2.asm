; 编写、安装中断 7ch 的中断例程
; 功能：将一个全是 字母，以 0 结尾的字符串，转化为 大写
; 参数：ds:si 指向 字符串的首地址
; 应用举例：将data 段中的字符串转化为 大写
;

assume cs:code , ds:data
	data segment
		db "conversation",0
	data ends

	code segment

		start:




			; 安装中断程序
			mov ax,0
			mov es,ax
			mov di,200h
			mov ax,cs
			mov ds,ax
			mov si,offset do7c; do7c 是代码段中的标号 ，数据段的标号，不用 offset

			mov cx,offset do7cend - offset do7c
			rep movsb

			; 设置向量; 偏移地址
			mov word ptr es:[7ch * 4],200H 
			mov word ptr es:[7ch * 4 + 2] , 0

			int 7ch
		
			mov ax,1111h
			mov ax,4c00h
			int 21h



				; 编写中断程序
			do7c:
				mov cx,13
				mov si,0
				mov ax,data ; 段的标号，不用 offset
				mov ds,ax
				s:
					mov bx,cx
					mov ch,0
					mov cl,ds:[si]
					jz cx_is_zero ; cx 为 0 跳
					mov ax,cx
					; 1101 1111 > DF
					and byte ptr ds:[si],011011111B
					inc si
					mov cx,bx
				loop s

				iret

				cx_is_zero:
					mov ax,2222h

					mov ax,4c00h
					int 21h

			do7cend:nop
		
	code ends

end start




		
