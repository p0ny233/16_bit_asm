; 在屏幕的5行12列显示3个红底高亮闪烁绿色的 'a'

; 1、先设置光标位置
; 2、然后设置需要显示的字符
assume cs:code
	code segment
	
		start:
			mov ah,2  ; 指定 2 号子程序
			mov bh,5  ; dh 中存放 行号
			mov bl,12 ; dl 中存放 列号

			int 10h

			
			; 指定调用中断例程中的 9号子程序
			mov ah,9 ; 指定 9 号子程序
			mov al, 'a'		; 字符
			mov bl,0cah		; 字符属性
			mov bh,0		; 第 0 页
			mov cx,3		; 字符重复次数

			int 10h


			mov ax, 4c00h
			int 21h





	code ends

end start