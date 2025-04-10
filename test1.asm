
section .data
  a:db 10
  b:db 15
  c:db 0

section .text

global  _start 

_start:

    xor rax, rax
    xor rbx, rbx

    mov al, [a]
    mov bl, [b]
    
    imul rax, rbx

    mov [c], al

  mov       rax, 60
  xor       rdi, rdi
  syscall
  ret

;    add al, '0'

;    CBW
;    CWD
;    cdq



;   mov rax,1
;   mov rdi,1 
;   mov rsi, c
;   mov rdx,1
;   syscall
    
;   for end
; mov       rax, 60         ; system call for exit
;    xor       rdi, rdi                ; exit code 0
;    syscall


   
        
;    ret