section .data
    msg_a db "input a: ", 10, 0
    msg_len_a equ $ - msg_a

a: dq 5
b: dq 10
c: dq 100

section .text
    global _start

_start:
    push qword [a] ;92
    push qword [b] ;84
    call sum       ;76
    add sp, 16

    mov [c], rcx
    
    mov rax, 60
    xor rdi, rdi
    syscall
    
sum:
    push rax       ;68
    push rbx       ;60
    push rbp       ;52

    mov rbp, rsp
    
    mov rax, [rbp+40]
    mov rbx, [rbp+32]
    add rax, rbx
    
    mov rcx, rax

    pop rbp ;60
    pop rbx ;68
    pop rax ;76

    ret ;84




; section .data

; msg_a db "input a: ", 10, 0
; msg_len_a equ $ - msg_a


; a:dq 5
; b:dq 10
; c:dq 100

; section .text

; global _start

; _start:
; push qword [a]
; push qword [b]
; push qword [c]
; ; call sum  ? lay next ? x/10gx $rsp
; pop qword [c]
; pop qword [b]
; pop qword [a]

; mov       rax, 60         ; system call for exit
; xor       rdi, rdi                ; exit code 0
; syscall
    
; ret

; sum: 

; mov rax, a


; ret









; section .data

; msg_a db "input a: ", 10, 0
; msg_len_a equ $ - msg_a


; a:db 0
; rl:dw 0

; section .text

; global _start

; _start:

; mov rcx, 5

; mitochka:
; push rcx
; call sum
; pop rcx

; loop mitochka

; mov       rax, 60         ; system call for exit
; xor       rdi, rdi                ; exit code 0
; syscall
    
; ret

; sum: 

; mov rax, 1
; mov rdi, 1
; mov rsi, msg_a
; mov rdx, msg_len_a
; syscall


; ret