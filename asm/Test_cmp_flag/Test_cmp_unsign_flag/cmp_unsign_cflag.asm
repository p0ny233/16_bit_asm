; 测试无符号 ，只需要关注 cf位、zf位
assume cs:code
	code segment
		start:
			; 1. zf = 1
			mov al,80H
			mov bl,80H
			cmp al,bl
			; 1. 测试结果：pf、zf 的值为1，cf 为 0

			; 2. zf = 0
			mov al,71H
			mov bl,61H
			cmp al,bl
			; 2. 测试结果：zf 、cf 都为 0

			; 3. cf = 1
			mov al,51H
			mov bl,61H
			cmp al,bl

			; 3. cf = 0
			mov al,71H
			mov bl,61H
			cmp al,bl



			; 4. cf = 0 并且 zf = 0
			mov al,71H
			mov bl,61H
			cmp al,bl

			; 5. cf = 1 或者 zf = 1

			; 5.1 cf = 1
			mov al,51H
			mov bl,61H
			cmp al,bl

			; 5.2 zf = 1
			mov al,61H
			mov bl,61H
			cmp al,bl





	code ends
end start