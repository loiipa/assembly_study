section .text               ;
    global _main

_main :
    mov rax, 0x2000004      ; 0x2000004(write) -> 레지스터 rax
    mov rdi, 1              ; write 함수에 쓰일 첫 번쨰 매개변수(int fd)
    mov rsi, msg            ; write 함수에 쓰일 두 번쨰 매개변수(user_addr_t cbuf)
    mov rdx, 12             ; write 함수에 쓰일 세 번째 매개변수(user_size_t nbyte)
    syscall                 ; rax에 있는(write) syscall 코드 실행
    mov rax, 0x2000001      ; 0x2000001(exit) -> 레지스터 rax
    mov rdi, 0              ; exit 함수에 쓰일 첫 번째 매개변수(int rval)
    syscall                 ; rax에 있는(exit) syscall 코드 실행

section .data
    msg db "Hello world!"
