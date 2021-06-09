assume cs:code ,ds:data
;使用 si 和 di 实现将字符串'welcome to masm!' 复制到后面的数据区中
    data segment
        db 'welcome to masm!'
        db '................'
    data ends

    code segment
            ; 使用si 定位 源数据区的字符串，使用 di定位 目标数据区
        start:
            mov ax,data
            mov ds,ax
            mov si,0
            mov di,0

            mov ax,0
            mov cx,16
            s:
                mov al,[si]
                mov [16+di],al

                inc si
                inc di
            LOOP s

            mov ax,4c00h
            int 21h
    code ends
end start        


















