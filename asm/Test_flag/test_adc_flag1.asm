; adc ָ�����λ�ӷ�ָ����� CFλ�ϼ�¼��ֵ
; ָ���ʽ��adb ��������1, ��������2
; ���ܣ���������1 = ��������1 + ��������2 + CF
;���磺adc ax,bx ʵ�ֵĹ����ǣ�(ax) = (ax) + (bx) + CF


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
