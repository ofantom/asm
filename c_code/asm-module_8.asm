
bits 64

section .data
    extern g_char2
    extern g_short_merged
    extern g_extended
    extern enc_string
    extern g_decoded

section .text
    global merge_and_extend
    global decode

merge_and_extend:
    movzx eax, byte [g_char2]
    movzx ebx, byte [g_char2 + 1]
    
    shl ebx, 8
    or ax, bx

    mov [g_short_merged], ax

    movsx eax, ax
    mov [g_extended], eax
    ret

decode:
    mov eax, [enc_string]
    mov [g_decoded], eax
    mov byte [g_decoded + 4], 0
    ret



; bits 64

; section .data
;     extern g_char2
;     extern g_short_merged
;     extern g_extended
;     extern enc_string
;     extern g_decoded

; section .text
;     global merge_and_extend
;     global decode

; merge_and_extend:
;     movzx ax, byte [g_char2]
;     shl ax, 8
;     mov al, byte [g_char2 + 1]
;     xchg al, ah

;     mov [g_short_merged], ax

;     movsx eax, ax
;     mov [g_extended], eax
;     ret

; decode:
;     mov eax, [enc_string]
;     mov [g_decoded], eax
;     mov byte [g_decoded + 4], 0
;     ret
