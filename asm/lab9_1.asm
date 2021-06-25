assume cs:code
; 在屏幕中间分别显示绿色[00000010 -- 02h]、绿底红色[00100100 --- 24h]、白底蓝色[01110001 -- 71h]的字符串 'welcome to masm!'
; 内存地址空间中，B8000H ~ BFFFFH 共32KB的空间，为80 x 25 彩色字符模式的显示缓冲区。
; 屏幕可以显示 80 个字符，一个字符占用两个字节【分别是ascii码、字符的属性】
	data segment
		; 绿色
		db 77H,02H,65H,02H,6cH,02H,63H,02H,6fH,02H,6dH,02H,65H,02H,20H,02H,74H,02H,6fH,02H,20H,02H,6dH,02H,61H,02H,73H,02H,6dH,02H,21H,02H
		
		; 绿底红色
		db 77H,24H,65H,24H,6cH,24H,63H,24H,6fH,24H,6dH,24H,65H,24H,20H,24H,74H,24H,6fH,24H,20H,24H,6dH,24H,61H,24H,73H,24H,6dH,24H,21H,24H
		
		; 白底蓝色
		db 77H,71H,65H,71H,6cH,71H,63H,71H,6fH,71H,6dH,71H,65H,71H,20H,71H,74H,71H,6fH,71H,20H,71H,6dH,71H,61H,71H,73H,71H,6dH,71H,21H,71H
		;源数据 字母开头需要加上 0，结尾需要加上h
		
	data ends

	code segment
	
		start:
			;初始化数据段
			mov ax,data
			mov ds,ax
			mov bx,0b800h
			mov es,bx
			mov bx,0
			mov cx,3
			mov si,0 ; 定位行
			
			s:
				mov ax, cx
				mov cx,16
				s1:
					mov dx,ds:[bx]
					mov es:[bx+si+1660], dx ;将源数据送入 es:[bx+si] 中，也就是显存中
					add bx,2
				loop s1
				add si,128	; 表示 16 个字符，占用32 个字节，一行中 80个字符占用 160个字节，所以 160-32 = 128
				
				
				mov cx,ax
				
			loop s
			
			
			
	
	code ends
	end start
	