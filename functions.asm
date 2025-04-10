bits 64

section .data
    extern num, ahoj, cpole, ipole, hex
    extern gandon
section .text
    global null
    global swap
    global move
    global turn

null:
    mov eax, dword [num]
    mov al, 0
    mov dword [num], eax
    ret

swap:
    mov ah, [ahoj]
    mov al, [ahoj + 1]
    mov bl, [ahoj + 3]
    mov ch, [ahoj + 4]

    mov [ahoj], ch
    mov [ahoj + 1], bl
    mov [ahoj + 3], al
    mov [ahoj + 4], ah
    ret

move:
    mov al, byte [cpole]
    movsx rax, al
    mov [ipole], eax

    mov al, byte [cpole + 1]
    movzx rax, al
    mov [ipole + 4], eax

    mov al, byte [cpole + 2]
    movsx rax, al
    mov [ipole + 8], eax

    mov al, byte [cpole + 3]
    movzx rax, al
    mov [ipole + 12], eax
    ret

turn:
    mov al, [hex]
    mov ah, [hex + 1]
    mov bl, [hex + 2]
    mov bh, [hex + 3]

    mov [hex + 3], al
    mov [hex + 2], ah
    mov [hex + 1], bl
    mov [hex], bh
    ret
