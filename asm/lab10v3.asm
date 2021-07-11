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
assume cs:code 
	data segment
		db 'Welcome to masm !',0  ; 18个字节
	data ends
	stack segment
		db 30 dup (0)
	stack ends
	
	code segment
		start:
			mov dh,2 ; 行
			mov dl,9 ; 列
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
			push cx ;字符属性push到栈中
			mov ch,0
			mov cl,ds:[si]
			
			jcxz over ;判断字符是否为 0
			push cx ; 字符push到栈中
			
			mov cl,dh
			jcxz rowadd
			
			mov al,0A0H
			mul dh ;mul 运算 8 位 乘法 的结果保存在 AX寄存器中
			jmp pushrowstack
			
			rowadd:
				mov ax,0
			pushrowstack:
				push ax; 将 行的地址 push 到栈中
			
			mov cl,dl ; 列 cl = 0c
			jcxz coladd ;如果 列为0 
			
			mov al,2
			mul cl
			
			coladd:
				; mov 
				push ax
				
			
			;显存的基地址
			mov ax,0b800h
			mov ds,ax
			pop di ; 列
			
			pop bx  ; 行
			pop ax	; 字符
			pop cx  ; 属性
			mov ah,cl
			mov [bx][di],ax
			inc dl
			inc si
			pop ds
			
			jmp show_str
			
		over:
			ret

		
	code ends
	
end start