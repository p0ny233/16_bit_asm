assume cs:code, ds:data, ss:stack
    data segment
        dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h ;【f】
    data ends

    stack segment
        dw 0,0,0,0,0,0,0,0 ;【1f】
    stack ends

    code segment
    start:
        ;初始化栈空间
        mov ax,stack
        mov ss,ax
        mov sp,20h

        ;初始化数据段
        mov ax, data 
        mov ds,ax
        mov bx,0

        ;需要前缀 push [0] 错误写法
        push ds:[0] 
        push ds:[2]

        pop ds:[2]
        pop ds:[0]

        mov ax,4c00h
        int 21h
    code ends

    end start