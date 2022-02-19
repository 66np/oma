SECTION	.data
msg	ddq	'Hello World', 0ah

SECTION .bss


SECTION .text
global	_start

_start:

	mov	edx, 13
	mov	ecx, msg
	mov	ebx, 1
	mov	eax, 4
	int	80h
