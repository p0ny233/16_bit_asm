assume cs:code,ds:data
	data segment
		; dw 1234,123 ,12345, 
		
		; 十进制1234 > 4D2  ，从数值上看是占用 12 位，但是使用dw伪指令就指定了数据宽度所以就在前面补0 > 04D2
		; 十进制 123 > 7B   ，从数值上看是占用 8 位，但是使用dw伪指令就指定了数据宽度所以就在前面补0 > 007B
		; 十进制12345 > 3039，从数值上看刚好占用 16 位，满足dw伪指令定义的数据宽度 
		
		; 在内存中分布：
		;	076A:0000  D2 04 7B 00 39 30
		
		; dw 65535 ;编译正常
		; dw 65536; 编译错误  Division by 0 or overflow
		dw 32768
		
		
		
		
		
		
		
		
		
		dw 'a','b'
		; a 的ASCII码是： 61 ; 占用8位，前面补0  > 0061 
		;	内存分布 076A:0000 61 00 62 00
		
		dw 'ab' ; a 和 b 的ASCII码分别是: 61 62，两个刚好占用16位
		; 在内存中分布：
		;	076A:0000  076A:0000 61 00 62 00 62 61	
										   ;  |  |
										   ;  b  a
											  
									
		  
		; dw 'abc' ; Syntax error
		
		
		
		
		dw 6161h
		;内存分布：
		; 076A:0000 61 00 62 00 62 61 61 61
		
		dw 0,0,0,0
		
		dw 'ab','cd','ef','gh'
		; 076A:0010 62 61 64 63 66 65 68 67            badcfehg      


	data ends
	code segment
		start:
			mov ax,data
			mov ds,ax
			nop
			
	code ends
	
end start

