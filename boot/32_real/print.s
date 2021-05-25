[bits 32] ; using 32-bit protected mode

; constants
VIDEO_MEMORY equ 0xb800
WHITE_ON_BLACK equ 0x0f ; the color byte for each char

print_string_pm:
    pusha
    mov edx, VIDEO_MEMORY

print_string_pm_loop:
    mov al, [ebx] ; [ebx] is the address of our char
    mov ah, WHITE_ON_BLACK

    cmp al, 0; check if end of string
    je print_string_pm_done

    mov [edx], ax ; store char + attribute in video memory
    add ebx, 1 ; next char 
    add ebx, 2 ; next video memory position

    jmp print_string_pm_loop

print_string_pm_done:
    popa
    ret