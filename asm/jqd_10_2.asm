; call 指令不能实现 短转移
; jmp short 标号 该指令实现短转移 ， 范围是 向后转移 最多127个 字节，向前转移 最多128个 字节，只是修改指令指针寄存器的值


; 依据 位移 进行转移的 call指令
assume cs:code
	code segment
		start:
			mov ax,0
			call s
			inc ax
			s:
				pop ax
	code ends
	
	
end start