LDA 8501H    ; Load higher byte of dividend into A
MOV B, A     ; Move A to B (Store higher byte of dividend in B)

LDA 8500H    ; Load lower byte of dividend into A
MOV D, A     ; Move A to D (Store lower byte of dividend in D)

LDA 8502H    ; Load divisor into A
MOV C, A     ; Move A to C (Store divisor in C)

MVI A, 00H   ; Clear A (Used for Quotient)
MOV E, A     ; Clear E (Used for Remainder)

MOV H, B     ; Move B (Higher Byte of Dividend) to H
MOV L, D     ; Move D (Lower Byte of Dividend) to L

LOOP: CMP C  ; Compare A (Remainder) with C (Divisor)
JC STORE_REM ; If carry is set, store remainder and end

SUB C        ; Subtract divisor from A (Partial Remainder)
INR E        ; Increment quotient counter
JMP LOOP     ; Repeat until division completes

STORE_REM: MOV D, A   ; Store remainder in D
MOV A, E     ; Move quotient to A
STA 8503H    ; Store quotient at 8503H
MOV A, D     ; Move remainder to A
STA 8504H    ; Store remainder at 8504H

HLT          ; Halt execution
