section .data
    hello db 'Hello World', 0xA, 0    ; string "Hello World" com quebra de linha e terminador nulo
    hello_len equ $ - hello - 1        ; comprimento da string (excluindo o terminador nulo)

section .text
    global _start

_start:
    ; syscall write(stdout, hello, hello_len)
    mov rax, 1          ; número da syscall write
    mov rdi, 1          ; file descriptor (stdout)
    mov rsi, hello      ; ponteiro para a string
    mov rdx, hello_len  ; número de bytes para escrever
    syscall             ; chama a syscall

    ; syscall exit(0)
    mov rax, 60         ; número da syscall exit
    mov rdi, 0          ; código de saída
    syscall             ; chama a syscall