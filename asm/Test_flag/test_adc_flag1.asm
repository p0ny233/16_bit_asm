; adc 指令：带进位加法指令，利用 CF位上记录的值
; 指令格式：adb 操作对象1, 操作对象2
; 功能：操作对象1 = 操作对象1 + 操作对象2 + CF
;比如：adc ax,bx 实现的功能是：(ax) = (ax) + (bx) + CF


assume cs:code
	code segment
		start:
			mov al,98H
			add al,al
			adc al,3
			
			mov ax,4c00h
			int 21H
	code ends
end start
