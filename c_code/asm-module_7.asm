bits 64

section .data

counter dq 0

section .text

    global prvocisla
prvocisla:
    enter 0,0 
    ; RDI - pole
    ; RSI - N
    ; RDX - P

    .mitocka:
    push rsi
        mov rbx, rdx
        push rdx
        
        ;sub rbx, 2
        mov rcx, 1
        .mitak:
        inc rcx
        cmp rcx, rbx
        je .prime_number
        mov rax, rbx
        cqo
        idiv rcx
        cmp rdx, 0
        je .skip
        cmp rcx, rbx

        jl .mitak
        .prime_number:
        
        mov [rdi], ebx
        add rdi, 4
        inc qword  [counter]
       .skip:



        
        pop rdx
        inc rdx
     pop rsi
    ;dec rsi
    ;cmp rsi, 0
     mov r8, qword  [counter]
     cmp r8, rsi
    jne .mitocka


    leave

    ret


    
    
; bits 64

; section .data



; section .text

;     global prvocisla
; prvocisla:
;     enter 0,0 
;     ; RDI - pole
;     ; RSI - N
;     ; RDX - P

;     .mitocka:
;     push rsi
;         mov rbx, rdx
;         push rdx
        
;         ;sub rbx, 2
;         mov rcx, 1
;         .mitak:
;         inc rcx
;         cmp rcx, rbx
;         je .prime_number
;         mov rax, rbx
;         cqo
;         idiv rcx
;         cmp rdx, 0
;         je .skip
;         cmp rcx, rbx

;         jl .mitak
;         .prime_number:
;         mov [rdi], rbx
;         add rdi, 4
;        .skip:



        
;         pop rdx
;         inc rdx
;     pop rsi
;     dec rsi
;     cmp rsi, 0
;     jg .mitocka


;     leave

;     ret
