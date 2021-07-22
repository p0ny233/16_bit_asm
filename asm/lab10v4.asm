; 除法溢出解决
; 编写子程序 divdw
; 功能：进行不会产生溢出的除法运算，被除数为 32位，除数为16位，结果为 32位
; 参数：
; 		 (ax)=被除数的低16位
; 		 (dx)=被除数的高16位
; 		 (cx)=余数
; 返回：
; 	   	 (dx)= 结果的高16位
;		 (ax)= 结果的低16位
;		 (cx)= 余数
; 例如：1000000/10 【F4240H / 0AH 】
; 该程序的逻辑是根据 数学公式 编写的

assume cs:code
	stack segment
		db 32 dup (0)
	stack ends
	code segment
		start:
			; mov ax,4240H
			; mov dx,000FH
			; mov cx,0AH
			;结果是 186A0 dx = 0001，ax = 86A0 ,  cx = 0

			mov ax,2BA0H
			mov dx,0013H
			mov cx,02H
			;结果是 ‭995D0‬ dx = 0009，ax = 95D0‬ ,  cx = 0
			
			mov bx,stack
			mov ss,bx
			mov sp,20h
			call divdw
			mov ax,4c00h
			int 21h
			
			divdw:
				; push ax ;4240 进栈
				; push dx ;000F 进栈
				; mov bx,65536
				
				;这里的目的是将除数放到ax中，因为div指令，8位除数默认存放在 AL，低16位在 AX，高16位存放在 DX
				mov bx,ax ;寄存器寻址
				mov ax,dx
				
				mov dx,0
				div cx ;dx = 0005 , ax = 0001
				
				push ax ; ax = 0001
				
				mov ax, bx
				div cx ; ax = 86A0 ,dx = 0 
				mov cx,dx
				pop dx
; 	   	 (dx)= 结果的高16位
;		 (ax)= 结果的低16位
;		 (cx)= 余数				
				ret	
		
	code ends
end start
	
