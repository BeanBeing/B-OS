org 0x7C00
bits 16

; Macro so no remember hexadecimal for new line
%define ENDL 0x0D, 0x0A
        
start:   
        ;; Because code is written above main, makes sure program starts at main
        jmp main
        
;; Prints a string to the screen.
;; Params:
;;;      - ds:si points to string

puts:
        ;; Save registers we will modify to stack
        push si
        push ax
        push bx

.loop:
        lodsb                   ; loads next character in al
        or al, al               ; verify if next character is null?
        jz .done

        mov ah, 0x0E            ; call bios interrupt
        mov bh, 0
        int 0x10

        jmp .loop               ; So code will loop

.done:
        ;;  After exiting loop, pop the files in reversed order
        pop bx
        pop ax
        pop si
        ret
        
        
        
        
main:
        ;; setup data segments
        mov ax, 0               ; can't write to ds/es directly
        mov ds, ax
        mov es, ax

        ;; setup stack
        mov ss, ax
        mov sp, 0x7C00          ; stack grows downward from where loaded in memory


        ;; prints message
        mov si, msg_hello
        call puts
        
        
        hlt

.halt:
        jmp .halt


msg_hello: db 'Hello, Welcome to B-OS!', ENDL, 0

times 510-($-$$) db 0
dw 0AA55h
