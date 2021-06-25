assume cs:code, ds:data, ss:stack
; 在屏幕中间分别显示绿色[00000010 -- 02h]、绿底红色[00100100 --- 24h]、白底蓝色[01110001 -- 71h]的字符串 'welcome to masm!'
; 内存地址空间中，B8000H ~ BFFFFH 共32KB的空间，为80 x 25 彩色字符模式的显示缓冲区。
; 屏幕可以显示 80 个字符，一个字符占用两个字节【分别是ascii码、字符的属性】, 低位字节存放字符，高位字节存放字符属性
; 
; 使用一个寄存器存放字符和字符属性

	data segment
		db 'welcome to masm!'
		db 02h,24h,71h
	data ends
	
	stack segment
		db 32 dup (0)
	stack ends
	
	code segment
		start:
			mov ax, data
			mov ds,ax
			mov bx,0
			
			mov ax,stack
			mov ss,ax
			mov sp, 20h
			
			
			mov ax,0b800h
			mov es,ax
			
			mov cx,16
			
			s:
			
				mov dl,[bx]
				mov dh, ds:[10h]
				
				;以上操作将 字符和字符属性存放在 dx 寄存器中
				push dx
				
				;
				
				pop es:[si]
				
				inc bx
				add si,2
			loop s
			

	code ends
	
	end start
	
	
	
	
	
	