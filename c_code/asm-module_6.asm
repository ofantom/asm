bits 64

section .data



section .text

    global bubble
bubble:
    enter 0,0 
    ; RDI - pole
    ; RSI - N
    ; RDX - asc_desc
    
    mov rcx, rsi
    .mitochka_outR:
    push rcx
    push rdi

    mov rcx, rsi
    dec rcx ; что-бы не выйти за пределы масива
    .mitochka:
    push rcx


    mov ebx, [rdi]
    add rdi, 4
    mov eax, [rdi]

    ; cmp ebx, eax ; cmp mas[i], mas[i+1]
    
    
    cmp RDX, 0
    jne .else_qweqwe
    
    ; if =>
    cmp ebx, eax ; cmp mas[i], mas[i+1]
    jge .skip ;    jle .skip
    jmp .endif_qweqwe
    
    .else_qweqwe:
    ; else =>
    cmp ebx, eax ; cmp mas[i], mas[i+1]
    jle .skip ;    jge .skip
    
    .endif_qweqwe:

    xchg ebx, eax
    sub rdi, 4

    mov [rdi], ebx
    add rdi, 4
    mov [rdi], eax

    .skip:


    pop rcx
    loop .mitochka  ; работает пока rcx > 0 


    pop rdi
    pop rcx
    loop .mitochka_outR

    leave

    ret
