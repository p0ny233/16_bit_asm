;利用栈，将定义的数据逆序存放
; assume cs:code
;     code segment
;         ; 定义数据
;         ; 初始化数据段然后将ss：sp指向该数据段变为 栈段
;         dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h ;【f】
;         dw 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ;【2f】  32个字节作为栈空间

;         start: 
        
;         mov ax, 075eh ; 指令段 段地址
;         mov ds, ax ; 数据段 段地址
;         ;定义栈
;         mov sp,030h
;         mov ss,ax
        
;         mov bx,0 
;          ; 32个字节作为 栈空间

;         mov cx,08h
        
;         s: push [bx]
;         add bx,2
;         loop s
;         mov ax,4c00h
;         int 21h

;     code ends

; end start


;疑问： 当执行 第14行指令之后，栈空间就会产生数据，
;       这些值有是 寄存器ax 的值【函数的某个参数地址】



assume cs:code 
    code segment
        dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h ;【f】
        dw 0,0,0,0,0,0,0,0  ;【1f】

        ;入口
        start:

        ;定义栈空间
        mov ax,cs
        mov ss,ax
        mov sp,020h ;sp 栈寄存器，存储栈偏移地址

        ;设置数据段的段地址以及偏移地址
        mov ds,ax
        mov bx,0


        ;设定loop循环次数
        mov cx,8h


        s: push ds:[bx]
        add bx,2
        loop s


        mov ax,4c00h
        int 21h

    code ends
    end start
