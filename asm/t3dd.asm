assume cs:code ,ds:data
	data segment
		dd 123456  ; > 占 32位，1E240 占20位，前面补0 > 0001E240
		; 内存分布 ： 076A:0000 40 E2 01 00
		
		dd 1234567 ; > 占 32位，12D687 占24位，前面补0 > 0012D687
		;内存分布：   076A:0000 40 E2 01 00 87 D6 12 00
		
		dd 4294967295 ;  编译正常
		; dd 4294967296 ;  Division by 0 or overflow
		
		
		
		
	data ends
	
	code segment
		start:
			mov ax, data
			mov ds,ax 
			nop
			nop
			nop
			nop
			
			
			
	code ends

end start
