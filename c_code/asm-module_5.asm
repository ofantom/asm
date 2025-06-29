bits 64

section .data



section .text

    global suma_cislic
suma_cislic:
    enter 0,0 

    xor rcx, rcx
    xor rax, rax

    .mitochka:

    mov cl, [rdi]
    cmp cl, 48  ; al - 48
    jl .skip
    cmp cl, 57
    jg .skip


    sub cl, 48

    movzx rcx, cl 
    add rax, rcx

.skip:
inc rdi
mov dl, [rdi]
cmp dl, '\0'
jne .mitochka

    leave

    ret
