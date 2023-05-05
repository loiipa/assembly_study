; wiki에 있는 fib logic 해석
fib:                            ; fib 함수
    mov edx, [esp+8]            ; fib 함수 인수가 저장된 메모리 위치 -> edx로 이동
    cmp edx, 0                  ;
    ja @f                       ; 조건 분기 명령어 (Jump if Above), @ - 현재 위치에서 가장 가까운 레이블, f(forward)
                                ; cmp edx, 0-> 0보다 클 때 : @@ 레이블로 분기 / 0보다 작거나 같을 때 : mov eax, 0
    mov eax, 0                  ;
    ret                         ; subroutine return - 0

    @@:                         ; 다음 라벨
    cmp edx, 2                  ;
    ja @f                       ; 2보다 크면 아래의 @@ 레이블로
    mov eax, 1                  ;
    ret                         ; subroutine return - 1

    @@:                         ; 다음 라벨
    push ebx                    ; ebx register -> stack push(ebx) (다른 곳에서 기록한 ebx를 살릴려고.?!)
    mov ebx, 1                  ; 1 -> ebx
    mov ecx, 1                  ; 1 -> ecx

    @@:                         ; 다음 라벨
        lea eax, [ebx+ecx]      ; 주소연산 ebx + ecx -> eax
        cmp edx, 3              ;
        jbe @f                  ; jumb if below or equal (3보다 작거나 같으면) - forward @@f로
        mov ebx, ecx            ; ecx -> ebx
        mov ecx, eax            ; eax -> ecx
        dec edx                 ; --edx
    jmp @b                      ; jump to the previous backward jump label(위의 @@로 이동)

    @@:                         ; 다음 라벨
    pop ebx                     ; stack -> ebx
    ret                         ; eax가 결과로 반환됨.

; esp - stack pointer(스택 포인터)
; call stack(호출 스택) 에서 현재 위치를 추적, 스택 메모리의 가장 높은 주소(top)를 가리키는 역할을 함.
