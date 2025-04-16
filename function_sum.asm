section .data

mas:db 16 dup(0)

section .text

global _start

_start:

lea rsi, mas
mov rax, 15
mov [rsi], rax

add rsi, 1

mov rax, 60
xor rdi, rdi
syscall

ret