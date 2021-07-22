assume cs:code, ds:data

	data segment
		db 'Welcome to masm !',0 ; 18 个字节[ 包括 0 ]
	data ends
	stack segment
		db 30 dup (0)
	stack ends
	
	code segment
		start:
			mov dh,0 ; 行
			mov dl,30 ; 列
			mov cl,2 ; 颜色
			
			mov ax,data
			mov ds,ax
			mov si,0
			
			mov ax, stack
			mov ss,ax
			mov sp,30h
			
			call show_str
			mov ax,4c00h
			int 21h
			
			
			
		show_str:
			push ds
			push cx
			; 1. 判断字符是否结束
			mov ch,0
			mov cl,ds:[si]
			jcxz over ; 字符结束，跳到标号 over
			
			; 2. 将读到的字符入栈
			push cx
			
			
			; 乘法运算 行首地址
			mov al,0A0H
			mul dh
			push ax
			
			
			
			; 乘法运算列地址
			mov al,2H
			mul dl
			push ax
			
			
			pop di ; 列
			pop bx ; 行
			
			
			; 显存的段地址
			mov ax,0b800H
			mov ds,ax
			
			pop ax ; 字符
			pop cx
			mov ah,cl
			
			mov ds:[bx][di],ax
			inc dl
			inc si
			; add di,2
			pop ds
			jmp show_str
		over:
			pop ax
			pop bx
			ret
	code ends		
	
end start
