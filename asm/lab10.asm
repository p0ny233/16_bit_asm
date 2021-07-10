;编写子程序
; 显示字符串，使调用者可以决定显示的位置【行、列】、内容、颜色
;  名称：show_str
;  功能：在指定的位置，用指定的颜色，显示一个用 0 结束的字符串
;  参数：(dh) = 行号【取值范围 0 ~ 24】
;		 (dl) = 列号【取值范围 0 ~ 79】
;		 (cl) = 颜色
;		 ds:si 指向字符串首地址
;
;  返回：无
;
;举例：在屏幕的 8 行 3列 用绿色显示 data段中的字符串
;
;    , R, G, B,    , R, G, B,
; 高    字体    闪	背景色
; 亮		    烁

; 绿色[高亮不闪烁]： 1 010 0 000


assume cs:code ,ds:data
	data segment
		db 'Welcome to masm !',0 ; 18个字节
	data ends
	
	stack segment
		db 30 dup (0)
	stack ends
	
	code segment
		start:
			mov ax,data
			mov ds,ax
			
			mov ax, stack
			mov ss,ax
			mov sp,20h
			; mov ax ,18
			; 循环 获取 定义好的字符串
			; 


			s:
				
				mov cl,ds:[si]
				jcxz over
				mov ch,0
				
				; 定义行,存放到栈中
				mov ax,8
				push ax
				
				; 定义列存放到栈中
				mov ax,3
				push ax
				call show_str
				inc si
				inc di
				
			jmp s
			
				
				
				
			
		show_str:
			mov ax,cx
			push ds ;
			mov cx,1000h ;为 让后面的push的操作数可以是一个cx
			add cx,ax
			push cx ; 将要写入显存的数据存放到 栈中
			mov dh,8 ; 要显示在哪一行
			mov ch,0
			mov cl,dh
			jcxz rowother
			mov al,0A1H
			mul dh ; 如果 dh 为 1 ，那 第2 行的首地址也就是 20h, 运算结果存放在 AX 中
			; push ax ; 将 不是第一行的首地址push到栈中
			mov cx,ax 
			rowother:
				push cx ; 将 定位到行的首地址push到栈中
				
				mov ch,0
				mov dl,3 ;要显示在 那一列
				mov cl,dl
				
				jcxz colother
					mov al,2
					mul dl ; 定位一个不为第一列的地址
					; push ax ; 将定位到列的地址push到栈中
					mov cx ,ax
					; jmp other
				colother:
					push cx ; 将 定位到的首地址push到栈中
			
				; 执行这个子程序，数据段的地址在栈底
				; 要显示的行地址在栈中间
				; 要显示的列地址在栈顶 先 pop 到 变址寄存器，再到 基址寄存器，然后才到 恢复数据段的izhi
				
				
				pop di ;列
				pop bx	;行
				
				; 显存 的偏移地址定位好之后，
				mov ax,0b800h
				mov ds,ax ;显存的 基地址
				pop ax
				mov ds:[bx]+[di], al
				mov byte ptr ds:[bx][di+1],10100000b
				
				
				pop ds
				ret
				
		over:
			; mov ax, 4c00h
			; int 21h
	code ends
end start