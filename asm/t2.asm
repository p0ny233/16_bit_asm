assume cs:code
;测试 jmp指令的范围【short、near、far】
;	jmp short s
;	jmp near ptr s【操作码显示：】



;	jmp far ptr s
;		会根据 位移的范围 进行翻译标号，使用 far 说明段间转移，但是实际的标号可以使用 short就可以完成的转移，
;		那么 操作码显示的是 以 short 显示的位移  
;
;	如果只有 far 能解释的 偏移量，那么显示的是 目的 的段地址 和 偏移地址，
;
;
;
;
;
	
	code segment
		start:
			mov ax,2000h
			mov ds,ax
			; jmp short s
			; 编译到 第 7 行 提示
			; Jump out of range by 173 byte
			; short 的范围是 
			;往前移 128 个字节，往后移动 127 个字节， 127 + 173 = 300
			
			
			; jmp near ptr s 
			; 在DOSbox显示的操作码：E92C01  jmp near 翻译为 E9，偏移量翻译为2C01
			; 先将 2C01 从高位字节到低位字节排序 012C  ，然后转换十进制：300
			
			
			jmp far ptr s 
			; 在DOSBox显示的操作码：EA 3601 6A07  ，先将字节从高位字节到低字节排序: 
			; 076A 0136 EA 
			; CS:IP >> 076A:0136
			; EA3601 6A07 >> 076A 0136
			
			
			
		
			
			
			
			
			
			
			
			
			
			
			
			; db 4 dup(0)
			db 121 dup(0)
			; db 4 dup(0)
			s:
			mov ax,4c00h
			int 21h
	code ends
	
	end start
	
; 疑问1： 
;		使用 jmp far ptr 标号，标号位移比较少，从 DOSBox中看出来解释指令意义改变的原因是，
		
;			 位移 >= 4 个字节？
;				源指令显示意义正常，执行指令的意义也是正常的

; 			 位移 <  4 个字节？
;				源指令显示意义不正常，但是指令执行的意义是正常的
		

疑问2：




































		
		