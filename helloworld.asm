; rax: function number
; rbx: execution location
; rcx: directory of memory of execution
; rdx: size of message in bytes

global _start

section .data

    msg: DB 'Hello World!', 0x0A
    msgsize: EQU $ - msg
    sizeone: EQU 1
    mesag: DB 48

section .bss
    out: resb 8

section .text

_start:
    mov r8, 10
_print:
    mov rax, 1
    mov rdi, 1
    mov dword [out], 48
    mov rsi, out
    mov rdx, 8
    syscall
    dec r8
    cmp r8, 0
    jne _print
_end:
    mov rax, 60
    mov rdi, 0
    syscall
