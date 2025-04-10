section .data

a:db 0
b:dw 2
c:dd 4
d:dq 8
f:db '0'
g:db '1'
ba:db "This is h", 0
h:db "Stroka", 13, 10, 0 ; тут нужно поствить кавчки
size_h equ $-h

section .text

global _start

_start:

mov rax, 1
mov rdi, 1
mov rsi, h
mov rdx, size_h
syscall


mov rax, 60
xor rdi, rdi
syscall

ret