SECTION	.data
msg	db	'Hello World', 0ah

SECTION .text
global	_start

_start:

	mov	edx, 13			; store length of msg
	mov	ecx, msg		; open msg string 
	mov	ebx, 1			; stdout, terminal
	mov	eax, 4			; incoke SYS_WRITE (kernel opcode 4)
	int	80h			; call the kernel

end:

        mov     ebx, 0                  ; return 0 status on exit - "No errors"
        mov     eax, 1                  ; invoke SYS_EXIT (kernel opcode 1)
        int     80h                     ; terminate program

