global _start

section .bss
out: resb 1

section .text
_start:
    mov rax, 0
    mov rdi, 1
    mov rsi, out
    mov rdx, 1
    syscall
    call _pout
    mov r8, [out]
    cmp r8, 48
    jne _start
    mov rax, 60
    mov rdi, 1
    syscall
    ret

_pout:
    mov rax, 1
    mov rdi, 1
    mov rsi, out
    mov rdx, 1
    syscall
    ret

_pnl:
    mov rax, 1
    mov rdi, 1
    mov dword [out], 0x0A
    mov rsi, out
    mov rdx, 1
    syscall
    ret

