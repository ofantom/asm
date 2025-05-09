section .data
a:db 5
c:db 10

h:db "ravno null", 0
size_h equ $-h

b:db "ne ravno null", 0
size_b equ $-b

mas:db 16 dup(0)

section .text

global _start

_start:

; lea rsi, mas
; mov rax, 15
; mov [rsi], rax


mov rax, 10
mov rbx, 20
cmp rax, rbx ; сравнение ==
je mitochka
jne mitochka2

mitochka:
mov rax, 1
mov rdi, 1
mov rsi, h       ; название строки (h)
mov rdx, size_h  ; размер строки (size_h)
syscall
jmp the_end

mitochka2:
mov rax, 1
mov rdi, 1
mov rsi, b       ; название строки (h)
mov rdx, size_b  ; размер строки (size_h)
syscall
jmp the_end

the_end:

mov rax, 60
xor rdi, rdi
syscall

ret