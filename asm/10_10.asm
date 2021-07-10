; 编程 ，使用子程序计算data段中的第一组数据的3次方，结果保存在后面一组 dword单元中
assume cs:code
	data segment
		dw 1,2,3,4,5,6,7,8
		dd 0,0,0,0,0,0,0,0   ;32位
	data ends
	
	code segment
		start:
			mov ax, data
			mov ss, ax
			mov ds,ax
			mov cx,8
			
			
			s1:
				call s
				mov [10H+bx],ax
				add bx,2
			loop s1
			mov ax,4c00h
			int 21h
			
			call s
			nop
			nop
			s:
				mov ax,[bx]
				mul word ptr [bx]
				mul word ptr [bx]
				ret
				
	code ends
	
end start

	