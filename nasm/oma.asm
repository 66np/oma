SECTION	.data
zero		db	0, 0h			; null byte to stop mem count
pname		db	"main.omma", 0h		; null byte to stop mem count

SECTION .bss
desc		resb	4 	; mem for storing FD
buffer		resb	1024	; reserved seq for mem addresses to read/write
len		equ	1024	; len (bytes)	

SECTION .text
global	_start

_start:

	call	read_from_file
	call 	write_to_ter
	call	exit

read_from_file:
	
	mov	ecx, 0			; read only
	mov	ebx, pname		; move opened FD into ebx
	mov	eax, 5			; invoke SYS_OPEN (kernel opcode 5)
	int	80h 			; open file 

	mov	[desc], eax		; store FD

	mov	eax, 3			; invoke SYS_READ (kernel opcode 3) 
	mov	ebx, [desc]		; move FD into ebx
	mov	ecx, buffer		; read to buffer
	mov	edx, len		; read len bytes 		
	int	80h			; read len bytes to buffer from file

write_to_ter:
	
	mov	edx, eax		; storing count of read bytes into edx
	mov	eax, 4			; invoke SYS_WRITE (kernel opcode 4)
	mov	ebx, 1			; stdout, terminal
	mov	ecx, buffer		; from buffer
	int	80h			; write to terminal read bytes from buffer

	mov	eax, 6			; invoke SYS_CLOSE (kernel opcode 6) 
	mov	ebx, [desc]		; FD
	int	80h			; close the FD

exit:
	
	mov	ebx, 0			; return 0 status on exit - "No errors"
	mov	eax, 1			; invoke SYS_EXIT (kernel opcode 1)
	int	80h			; terminate program	
