;byte 64

section .data

a:dw 246
b:dw 10
result:dd 0

section .bss

c: resw 2

section .text

global _start
_start:

;result = a+b
mov ax, 30000       ;делимое и оно же числитель                 
; dx:ax/bx 
; edx:eax/ebx
; ax/bl

;  a - Название переменной это есть адрус нулевого байта переменной
; [a] - Квадратные скобки это перейти по пдресу "a" к ячейке памяти
mov bx, 30          ;делитель и он же знаменатель
xor dx, dx
;mov rdx, 1
div bx
mov [result], rax

mov rax, 60 ; syscall: exit
xor rdi, rdi ; status: 0
syscall; make the syscall