# x86_64-asm-exercises
a few programs that i implemented in x86_64 assembly on linux

## compiler and specification
the compiler used is nasm, linker is ld
elf64 as output format for nasm, DWARF as debug format

gdb was used as a debugger

## why tho
these exercises were mostly to learn something about assembly and also the background of output in c and c++
i did not use any parts of the c library as i wanted to also learn about syscall and code with little
abstraction

## problems faced
the conversion from integer to string in printnum was definitely the hardest part, lots of loops woa
