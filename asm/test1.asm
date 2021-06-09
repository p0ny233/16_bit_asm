;测试 单纯数字的传送编译后是否会 转换十六进制，结果是 
; 单纯的数字传送编译后是会 被转为 十六进制
;直接在debug 中调试的输入的数字都是十六进制在的



assume cs:code
    code segment
    start:
        mov ax,200
        mov ax,200h
    code ends

    end start
end