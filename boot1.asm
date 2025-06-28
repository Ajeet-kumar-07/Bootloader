bits 16                 ; Tell NASM we're writing 16-bit code
org 0x7c00              ; Set the origin to 0x7C00

boot:
    mov si, hello       ; Point SI to the message
    mov ah, 0x0e        ; BIOS teletype function

.loop:
    lodsb               ; Load byte from [SI] into AL and increment SI
    or al, al           ; Check if byte is null terminator
    jz halt             ; If so, jump to halt
    int 0x10            ; Call BIOS to print character
    jmp .loop           ; Repeat

halt:
    cli                 ; Disable interrupts
    hlt                 ; Halt execution

hello: db "Hello world!", 0 ; Null-terminated message

times 510 - ($ - $$) db 0   ; Pad the rest with zeroes
dw 0xAA55                   ; Boot sector signature