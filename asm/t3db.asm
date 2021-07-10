assume cs:code,ds:data
	data segment
		
		db 1h,2h,3h,4h,10,20 ; 定义的数据可以是十六进制可以是 十进制【只能 <= 255】
		
		db '1','a','b' ; 双引号括起来的字符在内存中 以ascii码存在，可以分开定义
		db 'abcdefghijklmn'	;也可以连续定义，但是定义的时候需要引号
		
		;db 256   ;错误写法 编译提示 value out of range，

		
		;db 123h  ;错误写法 编译提示 value out of range，
		;db 1234h  ;错误写法 编译提示 value out of range  
		;db 12345h ;错误写法 编译提示 division by 0 or overflow
		
		;使用 db 定义数据，在内存中分布的情况是 依次排列顺序不变
		; 076A:0000 01 02 03 04 0A 14 31 61-62 61 62 63 64 65 66 67
		; 076A:0010 68 69 6A 6B 6C 6D 6E 6F-00 00 00 00 00 00 00 00
		
		
	data ends
	code segment
		start:
			mov ax,data
			mov ds,ax
	code ends
	
	end start