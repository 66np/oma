## progress

completed.

## objective

building I/O application of files only named main.omma using nasm x86 assembly to read file and print contents to terminal.
  
## instructions

1. write your assembly program (.asm) and save it.                 
1. compile it by running `nasm -felf64 oma.asm && ld oma.o -o oma && ./oma`

## learning lessons

1. 'section' denotes an independent memory sequence to toward an object file. 'segment' functions similarly, except the difference is that section includes info required at the linking stage whereas segment contains data needed at runtime.
1. 'db', 'dw', 'dd', 'ddq'/'do' are 8-, 16-, 32-, 64-bit sized data definitions. 'dd', 'dq', 'dt' are float, double, extended precision data definitions.
1. executable and linkable format (ELF) is used to store executable files (.exe), object code (.o), shared libraries (.so.~) and debugging info (aka the core dumps).
1. look into [general purpose registers](https://docs.microsoft.com/en-us/windows-hardware/drivers/debugger/x64-architecture). ax, accumulator register, for arithmetic operations. bx, base register, used for array operations and occasionally points to stacks. cx, counter register, for counting and looping. dx, data register, to reserve values of datapoints. there are more like segment registers, index registers, pointer regsiters etc. learn more [here](http://www.baskent.edu.tr/~tkaracay/etudio/ders/prg/pascal/PasHTM2/pas/lowlevel.html).
1. block starting symbol (.bss) is a portion of the code that contains statically allocated variables without assigned values (i.e. user input such as 'name' will not be known unti during or after runtime).
1. '.global' is a directive that marks a symbol/variable a global (or visible).
1. uninitialized data reservations - 'resb 1' allocates 1 byte, 'resw 1' allocates 2 bytes for a word, 'resd 1' allocates 4 bytes for a doubleword, 'resq 1' allocates 8 bytes for a quadword, 'rest 1' allocates 10 bytes.
1. initialized data definitions - 'db 1' allocates 1 byte, 'dw 1' allocates 2 bytes for a word, 'dd 1' allocates 4 bytes for a doubleword, 'dq 1' allocates 8 bytes for a quadword, 'dt 1' allocates 10 bytes.
1. copying large pieces of data - esi (source next), edi (destination next).
1. most efficient way to null a value (zero it out) is `xor edi, edi`
