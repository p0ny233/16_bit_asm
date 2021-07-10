; ret 和 retf
; ret ：该指令是用栈中的数据，修改IP 的内容，从而实现 近转移
; retf：该指令是用栈中的数据，修改 CS 和 IP 的内容，从而实现 远转移

; 执行 【ret】 指令的步骤：
; 	1. POP IP
;   2. cpu 根据 cs:ip 执行

; 执行 【retf】 指令的步骤：
;	0. POP CS
; 	1. POP IP
;   2. cpu 根据 cs:ip 执行
assume cs:code, ss:stack
	stack segment
		db 16 dup (0)
	stack ends
	code segment
		mov ax,4c00h
		int 21h
		
		start:
			mov ax, stack
			mov ss,ax
			mov sp,10h
			mov ax,0
			push ax ;将代码段的 第一个字节的地址压栈，间接实现了call指令
			mov bx,0
			ret
	code ends
end start

