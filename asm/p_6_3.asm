; 使用 0:0~0:15单元中的数据改写程序中的数据
;使用栈来传送

; 将各个段进行分段存放
assume cs:code ,ds:data, ss:definestack
    ; 数据段
    data segment
        dw 0123h,0456h,0789h,0abch,0defh,0fedh,
        0cbah,0987h ;【f】
    data ends

    ; 栈段
    definestack segment
        dw 0,0,0,0,0,0,0,0 ;[1f]
    definestack ends

    ;代码段
    code segment
        ;初始化栈针
        mov ax,definestack
        mov ss,ax
        mov sp,20h

        ;初始化数据段
        mov ds,ax
        mov bx,0

        s: push 0:[bx]
        pop [bx]
        add bx,2

        loop s

        mov ax,4c00h
        int 21h
        
        
    code ends
    end

        

