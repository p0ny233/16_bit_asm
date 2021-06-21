assume cs:code,ds:data
	;用 div 计算data段中第一个数据除以第二个数据后的结果，
	; 商存在第三个数据的存储单元中
	data segment
		dd 100001
		dw 100  ;defined word 定义字  16 位除数，商放在 ax、余数在 dx 中
		dw 0
		
	data ends
	code segment
		start:
			mov ax,data
			mov ds,ax
			mov si,0
			mov ax, word ptr [si] ; 1,0 >  86a1 将被除数的低16位 传送给 ax
			add si,2
			mov dx, word ptr [si] ; 3,2  > 0010 将被除数的高16位 传送给 dx
			add si,2
			div	word ptr [si] ; 4
			add si,2
			mov word ptr [si],ax ; 3
			mov ax, 4c00h
			int 21h

	code ends
	end start
	