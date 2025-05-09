section .data

a:db "nast", 10, 0 ; тут нужно поствить кавчки
size_a equ $-a
b:db 3  ;название являеться названием адреса в понятии самой самости

section .text

global _start

_start:

call perestanovka

mov rax, 60
xor rdi, rdi
syscall

ret


perestanovka:

lea rsi, a ;копирует адрес начального байта

mov rcx, size_a
mitOchka:
push rcx

;add rsi, 2
mov rax, 1
mov rdi, 1
mov rsi, rsi     ; название строки (h)
mov rdx, 1  ; размер строки (size_h)
syscall

inc rsi
pop rcx
loop mitOchka


ret