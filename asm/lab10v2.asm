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
assume cs:code, ds:data
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
			
			mov ax,stack
			mov ss,ax
			mov sp,20h
			
			;用户自定义 行、列数
			mov dh, 0 ; 行
			mov dl, 0 ; 列
			mov cl,dh
			jcxz rowaddone
			

				
			
			
			
			
			
			s:
				mov ch,0
				mov cl,ds:[si]
				jcxz over
				call show_str
				inc si
				inc dl
			jmp s
			rowaddone:
				inc dh
				mov cl,dl
				jcxz coladdone
				
				jmp s
			coladdone:
				inc dl
				jmp s
				
			show_str:
			
				push cx
				
				push ds
				;将 ds修改为 显存的基地址
				mov ax,0b800h
				mov ds,ax
				
				mov ax,0A1h
				mul dh
				push ax ;将定位到行的地址push到栈中 基址寄存器
				
				mov ax,2h
				mul dl
				push ax ;定位显存的ascii地址	  变址寄存器
				
				pop di
				pop bx 
				pop cx
				pop ax
				
				mov [bx][di], al
				mov ds,cx
				ret 
				
			over:
				mov ax,4c00h
				int 21h
				
				
				
;  参数：(dh) = 行号【取值范围 0 ~ 24】
;		 (dl) = 列号【取值范围 0 ~ 79】
;		 (cl) = 颜色	

	code ends
	
end start

















