section .data

a:dd 5 dup(0)
str:db "this is procedure", 10,13,0
len equ $-str

section .bss

b:resd 5

section .text

global _start

_start:
mov eax, 5
mov rcx, 5
mov rdx, 0

metka1:
mov eax, edx
imul eax, eax
mov dword [b + rdx * 4], eax
inc rdx
cmp rdx, 6


power:
push rcx
mov rax, 1
mov rdi, 1
mov rsi, str
mov rdx, len
syscall
; написать программу которая записывает в масив квадрат индекса елемента b(0,1,4,9,16,25)
pop rcx
ret