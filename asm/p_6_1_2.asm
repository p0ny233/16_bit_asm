; 使用 0:0~0:15单元中的数据改写程序中的数据
;使用栈来传送

assume cs:code
    code segment
        dw 0123h,0456h,0789h,0abch,0defh,0fedh,0cbah,0987h ;【f】
        dw 0,0,0,0,0,0,0,0,0,0  ;【23h】
        start:
        ;初始化栈针
        mov ax,cs
        mov ss,ax
        ; mov sp,34h
        mov sp,24h

        ;初始化数据段 段地址
        mov ax,0
        mov ds,ax
        mov bx,0

        ;设定循环次数
        mov  cx,8h ;16个字节
        s:
        push [bx]
        ; 写法一
        pop cs:[bx]

        ;写法二
        ; pop ss:[bx]

        add bx,2

        loop s

        mov ax,4c00h
        int 21h

    code ends
    end start



        

