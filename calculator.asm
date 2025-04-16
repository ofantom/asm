section .data

a:dq 10
b:dq 5
c:dq 10000

section .text

global _start

_start:

push qword [a];92
push qword [b];84
call sum;76
add rsp, 16;100

push qword [a]
push qword [b]
call multiply
add rsp, 16

push qword [a]
push qword [b]
call del
add rsp, 16

mov rax, 60
xor rdi, rdi
syscall

ret

sum:
push rbp;68
mov rbp, rsp

xor rax, rax
xor rbx, rbx

mov rax, [rbp + 24]
mov rbx, [rbp + 16]
add rax, rbx

mov rsp, rbp
pop rbp;76
ret;84

multiply:
push rbp
mov rbp, rsp

xor rax, rax
xor rbx, rbx

mov rax, [rbp + 24]
mov rbx, [rbp + 16]

imul rax, rbx

pop rbp
ret

del:
push rbp
mov rbp, rsp

xor rdx, rdx
mov rax, [rbp + 24]
mov rbx, [rbp + 16]

div rbx

pop rbp
ret

