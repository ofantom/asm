
section .data

msg_a db "input a: ", 0
msg_len_a equ $ - msg_a

msg_b db "input b: ", 0
msg_len_b equ $ - msg_b

msg_c db "input c: ", 0
msg_len_c equ $ - msg_c

a:db 0
b:db 0
c:db 0
rl:dw 0

fmt:    db "rl=%ld", 10, 0

section .text

global _start

extern printf

_start:

push rbp

mov rax, 1
mov rdi, 0
mov rsi, msg_a
mov rdx, msg_len_a
syscall

mov rax, 0
mov rdi, 0
mov rsi, a
mov rdx, 1
syscall


mov rax, 0   ; Читаем и игнорируем лишний символ (обычно \n)
mov rdi, 0
mov rsi, rbp  ; временная переменная
mov rdx, 1
syscall

; ----------------------------------------------------------------
mov rax, 1
mov rdi, 0
mov rsi, msg_b
mov rdx, msg_len_b
syscall

mov rax, 0
mov rdi, 0
mov rsi, b
mov rdx, 1
syscall

mov rax, 0   ; Читаем и игнорируем лишний символ (обычно \n)
mov rdi, 0
mov rsi, rbp  ; временная переменная
mov rdx, 1
syscall

; ----------------------------------------------------------------

; Ctrl + /

mov rax, 1
mov rdi, 0
mov rsi, msg_c
mov rdx, 9
syscall

mov rax, 0
mov rdi, 0
mov rsi, c
mov rdx, 1
syscall


mov rax, 0   ; Читаем и игнорируем лишний символ (обычно \n)
mov rdi, 0
mov rsi, rbp  ; временная переменная
mov rdx, 1
syscall
; ----------------------------------------------------------------

xor rcx, rcx
mov cl, [a]
sub cl, '0'
mov [a], cl 

xor rcx, rcx
mov cl, [b]
sub cl, '0'
add [b], cl

xor rcx, rcx
mov cl, [c]
sub cl, '0'
add [c], cl

mov al, [a]
add al, [b]

mov dl, 5
mul dl

mov bx, ax

mov al, [c]
cbw 

xchg ax, bx

sub ax, bx

cwd
cdq
mov rdi, fmt
mov rsi, rax
mov rax, 0
call printf

pop	rbp

mov       rax, 60         ; system call for exit
xor       rdi, rdi                ; exit code 0
syscall
    
ret