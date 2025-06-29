bits 64

section .data



section .text

    global min_pos
min_pos:
    enter 0,0
    
;   rsi = длина массива (кол-во элементов) ← (int t_N) 
;   eax ← стартовое значение минимума (макс. int), eax = текущий минимум
;   rcx ← индекс i = 0  => rcx = текущий индекс в массиве
;   ebx = ноль для сравнения, для выявления полож чисел
;   rdi содержит адрес начала массива   


    movsx rsi, esi
    mov eax, 0x7FFFFFFF
    xor rcx, rcx

.cikl:
    cmp rcx, rsi  ;cmp rcx, rsi
    jge .end

    mov ebx, [rdi + rcx * 4]                            ; mov ebx, 0 
    cmp ebx, 0                                          ; cmp [rdi + rcx * 4], ebx

    jl .skip
; ---------------------------

    cmp ebx, eax                                        ;cmp [rdi + rcx * 4], eax
    jge .skip


    mov eax, ebx                                        ;[rdi + rcx * 4]
    
    
; ---------------------------
.skip:
    inc rcx ; i++
    jmp .cikl



.end:
    leave
    ret

ret

; Основные проблемы:
; 1. 🔁 Ты 3 раза читаешь одно и то же из памяти: