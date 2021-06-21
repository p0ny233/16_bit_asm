assume cs:code ,ds:data
	; db 定义字符串，在内存中的顺序是不变的
	; dw以及dd定义字符串，在内存中的排序是相反的
	
	;dup 指令
	; 指令格式：
				; db 重读定义次数 dup ('abc')
				; dw 重读定义次数 dup ('abc')
				; dd 重读定义次数 dup ('abc')
	data segment
		;db ==========================================
		; db 2 dup ('abc')  	; 076a:0000	61 62 63 61 62 63
		
		db 2 dup ('a','b','c')  ; 076a:0000	61 62 63 61 62 63
		
		db 10 dup (0)
		
		; dw ========================================
		dw 1 dup ('a')  ;	076a:0010	61  00
		
		; dw 1 dup ('a','b','c')  ; > 076a:0010	61 00 62 00 63 00   
		; 每个 word 只能存放 两个字符，61 00 ，单个word只有单个字符时，放在低16位字节
		
		
		dw 1 dup ('ab') ;62 61
		;6162h 62 是低8位，61是高8位
		; 内存从小到大显示：62 61，第一个字符放在高位字节，第二个字符放在低位字节
		
		
		; dw 1 dup (07bh) ; dw 只能存放 两个字符，007b
		; 123是十进制 转为 16进制 = 7b
		dw 1 dup (123,124,125) ; 7b 00 7c 00 7d 00
		db 1 dup (0)
		dw 1 dup ('b')
		
		db 3 dup (0)
		;dd =============================================
		; dd 1 dup ('a')  ;076a:0020	61 00 00 00 
		; dd 1 dup ('ab') ;076a:0024	62 61 00 00 
		
		
		
		; dd 1 dup ('ab','cd')  ; syntax error
		dd 'abcd'  ; syntax error
		; dd 1 dup ('abcd') ; syntax error
		
	data ends
	
	code segment
		start:
			mov ax, data
			mov ds,ax
		
		
		
	code ends
	end start