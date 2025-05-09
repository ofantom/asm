section .data
name:db "2*x*(y+3)", 10, 13, 0
size_name equ $-name
a:dq 2
b:dq 3
x_str:db "enter num for x: ", 0
size_x equ $-x_str
y_str:db "enter num for y: ", 0
size_y equ $-y_str
x:dq 0
y:dq 0
result: dq 0

mas:db 16 dup(0)

section .text

global _start

_start:

; 2*x*(y+3)

mov rax, 1
mov rdi, 1
mov rsi, name       ; название строки (h)
mov rdx, size_name  ; размер строки (size_h)
syscall

mov rax, 1
mov rdi, 1
mov rsi, x_str       ; название строки (h)
mov rdx, size_x  ; размер строки (size_h)
syscall

mov rax, 0
mov rdi, 0
mov rsi, x
mov rdx, 1
syscall
sub qword [x], 48

mov rax, 0   ; Читаем и игнорируем лишний символ (обычно \n)
mov rdi, 0
mov rsi, rbp  ; временная переменная
mov rdx, 1
syscall

mov rax, 1
mov rdi, 1
mov rsi, y_str       ; название строки (h)
mov rdx, size_y  ; размер строки (size_h)
syscall

mov rax, 0
mov rdi, 0
mov rsi, y
mov rdx, 1
syscall
sub qword [y], 48

mov rax, 0   ; Читаем и игнорируем лишний символ (обычно \n)
mov rdi, 0
mov rsi, rbp  ; временная переменная
mov rdx, 1
syscall
_start2:
call funkcia


mov rax, 60
xor rdi, rdi
syscall

ret

funkcia: ; 2*x*(y+3)   a=2 b=3

xor rax, rax

mov rax, [y]
add rax, [b]
imul rax, [x]
imul rax, [a]
mov [result], rax

ret