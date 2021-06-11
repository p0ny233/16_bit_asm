assume cs:code, ds:datasg
	datasg segment
		db 'ibm             '
		db 'dec             '
		db 'dos             '
		db 'vax             '
		
		db '  ' ;使用两个字节来保存cx 的值
		
	datasg ends
	
	code segment
		start:
			mov ax,datasg
			mov ds, ax
			mov bx,0
			mov cx, 4
			
			
			s:
				;需要将 cx 的值保存起来，v1_1是使用 dx寄存器来保存cx 的值
				;但是若有多个 cx 的值，没有足够的寄存器来保存，就选择使用内存空间来保存
				
				;v1_2 【使用内存空间来保存cx 的值】
				mov ds:[40],cx
				mov si,0
				mov ax,0
				
				mov cx,3 ;设置内层循环的次数
				s0:
					mov al,[bx+si]
					and al,0dfh
					mov [bx+si],al
					inc si
					
				loop s0
				mov cx,ds:[40]
				add bx,10h
				
			
			loop s
			mov ax,4c00h
			int 21h
			
		code ends 
	end start
			
			
			
			
					
				