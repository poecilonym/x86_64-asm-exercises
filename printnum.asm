global _start

section .text

_start:
    mov r8, 0
    mov r9, 1
    mov r10, 90
_loop:
    call _printr8
    mov r11, r9
    add r9, r8
    mov r8, r11
    dec r10
    cmp r10, 0
    jne _loop

    mov rax, 60
    mov rdi, 1
    syscall
    ret

_printr8:
    push r8
    push r9
    push r10
    push r11
    mov r9, 0
    cmp r8, 0
    je _zerocas
    cmp r8, 0
    jg _divloop
    call _pdash
    neg r8
_divloop:
    cmp r8, 0
    je _loopprint
    inc r9
    xor rdx, rdx
    mov rax, r8
    mov r10, 10
    div r10
    mov r8, rax
    add rdx, 48
    push rdx
    jmp _divloop
_zerocas:
    inc r9
    push 48
_loopprint:
    pop r8
    mov [out], r8
    call _printout
    dec r9
    cmp r9, 0 
    jne _loopprint
    pop r11
    pop r10
    pop r9
    pop r8
    call _pnewline
    ret

_printout:
    mov rax, 1
    mov rdi, 1
    mov rsi, out
    mov rdx, 1
    syscall
    ret

_pnewline:
    mov rax, 1
    mov rdi, 1
    mov rsi, newline
    mov rdx, 1
    syscall
    ret

_pdash:
    mov rax, 1
    mov rdi, 1
    mov rsi, dash
    mov rdx, 1
    syscall
    ret

    
section .bss
out: resb 1

section .data

newline DB 0x0A
dash DB '-'
