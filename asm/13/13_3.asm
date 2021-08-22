; 用 7ch 中断例程完成 loop指令的功能
; loop 指令
; 应用举例：在屏幕中间显示 80 个 "!"

assume cs:code
	code segment
		start:
			
			; 1、安装中断程序
			mov ax,0;
			mov es,ax
			mov ax,200h
			mov di,ax
			mov ax,cs
			mov ds,ax
			mov si,offset do7ch
			mov cx,offset do7end - offset do7ch
			rep movsb




			; 2、设置向量表
			mov word ptr es:[7ch * 4],200h ; 偏移量
			mov word ptr es:[7ch * 4 + 2],0h ; 段地址


			; 3、触发中断前 push 设置好的 循环次数

			int 7ch
			mov ax,4c00h
			int 21h



			do7ch:
				; 初始化目标内存地址
				mov ax, 0b800h;
				mov es,ax;
				mov ax,0A0H
				mov di,ax


		        mov cx, 80 ; 循环次数
				mov ah,20h ; 字符颜色：绿色
				mov al,	33 ; 这是一个感叹号


				s:
					mov bx,cx

					mov es:[di], ax

					dec bx
					mov cx , bx
					add di,2

					jcxz do7end ; 跳转中断
					dec bx
					
					jmp s

				do7n:
					iret

				do7end:
					nop




				
				

				
				
				








			
	code ends