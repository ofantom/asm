

section .data
	a:db 10
    b:db 15
    c:db 0
	
section .bss
	

section .text

global  _start 

_start:

    mov rax, a
    add rax, b
    mov qword [c],rax 

	mov       rax, 60         ; system call for exit
    xor       rdi, rdi                ; exit code 0
    syscall
        ret