bits 64

section .data



section .text
    global petr
    global zamena
    global hostpart
petr:
    enter 0,0 
; RDI – 1-й аргумент
; RSI – 2-й аргумент
; RDX – 3-й аргумент
; RCX – 4-й аргумент
; R8  – 5-й аргумент
; R9  – 6-й аргумент

; rdx - octacha
; rax - celoe 
mov r8, rdx
mov rcx, 5

.cize:
    push rcx

    mov rax, qword [rdi] ;adres
    mov rcx, 2
    xor rdx, rdx
    div rcx

    cmp rdx, 0
    je .chetn
    
    inc dword [rsi]
    jmp .mitochka
.chetn:
    mov rax, [rdi]
    add [r8], rax
.mitochka:
    add rdi, 8 ;perechod na sled element masiva

    pop rcx
    loop .cize

    mov rax, [r8]
    mov rcx, 5
    xor rdx, rdx
    div rcx
    mov [r8], rax

    leave
    ret


zamena:
    enter 0, 0
    ; RDI – 1-й аргумент
    ; RSI – 2-й аргумент
    ; RDX – 3-й аргумент
    ; RCX – 4-й аргумент
    ; R8  – 5-й аргумент
    ; R9  – 6-й аргумент

    ; rdi — pointr
    ; rsi — simvol kotor menaju
    ; rdx — nov simvol

    mov rbx, rdi
    mov al, sil          ; al — символ для замены
    mov cl, dl           ; cl — новый символ

.loop:
    mov dl, byte [rbx]
    cmp dl, 0
    je .skip

    cmp dl, al
    jne .mitac

    mov byte [rbx], cl

.mitac:
    inc rbx
    jmp .loop

.skip:
    leave
    ret



hostpart:
    enter 0, 0
    ; RDI — адрес айпи
    ; RSI — адрес маски
    ; RDX — адрес массива из 4 байт

    mov eax, dword [rdi]
    mov ecx, dword [rsi]
    not ecx
    and eax, ecx

    mov byte [rdx],     al ;     ah, al
    mov byte [rdx + 1], ah ;     al, ah

    shr eax, 16
    mov byte [rdx + 2], al
    mov byte [rdx + 3], ah

    leave
    ret





; маска (почти)

;                0100 0001 1010 0001                  168.0.1
; 0001 0010 0100 1111 1000 0000 0000              192.000.0.0

; 00000001 00100101 00111001 10100001              192.168.0.1