; 编程：在屏幕的 5 行 12列 显示字符串 "Welcome to masm!"

; 1、设置光标的位置
; 2、设置显示的字符

assume cs:code, ds:data
	data segment
		db "Welcome to masm!$"
	data ends

	code segment
		start:
			mov ah,2	; 指定中断的 2号 子程序
			mov bh ,0	; 指定页号
			mov dh,5	; dh 中存放 行号
			mov dl,12	; dl 中存放 列号
			int 10h


			mov ax,data

			; ds:dx ： 指向字符串地址
			mov ds,ax
			mov dx,0
			mov bl,0cah
			mov ah,9	; 指定中断的 9 号子程序
			int 21h


			mov ax,4c00h
			int 21h
	code ends
end start
