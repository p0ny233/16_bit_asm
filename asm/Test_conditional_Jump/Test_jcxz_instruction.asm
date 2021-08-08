; 所有的 有条件跳转指令 都是 段内短转移

; 在书上的 184 页，经过测试确实如此
; 短转移的范围： -128 - 127 【向前转移 128 个字节数，向后转移127个字节数】
; 超过该范围提示： Jump out of range by 超过的字节数 byte(s)

;dup 指令
	; 指令格式：
			; db 重复定义次数 dup ('abc')
			; dw 重复定义次数 dup ('abc') 2个字节
			; dd 重复定义次数 dup ('abc') 4 个字节



assume cs:code
	code segment

			s:
				mov ax,4c00h
				int 21h
				db 100 dup (0)
		start:
			mov ax ,1
			mov cx,0
			jcxz far ptr s 
			; 机器码：E3 8F ,说明 far类型没有作用。
			; 所以确定条件跳转指令是 短转移。
			; 8F = 1000 1111
			; 将 8F 看作有符号数 1111 0000 + 1 = 1111 0001 
			; 数值为：111 0000 = 113


			mov bx,ax


	code ends
end start

