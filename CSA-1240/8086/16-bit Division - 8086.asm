ORG 100H         ; Set origin for COM file execution

MOV SI, 1100H    ; Load address of dividend
MOV DI, 1102H    ; Load address of divisor

MOV AX, [SI]     ; Load dividend (16-bit) into AX
MOV BX, [DI]     ; Load divisor (16-bit) into BX

DIV BX           ; Perform unsigned division (AX / BX)
                 ; AX ? Quotient, DX ? Remainder

MOV [1200H], AX  ; Store quotient in memory (1200H)
MOV [1202H], DX  ; Store remainder in memory (1202H)

HLT              ; Halt execution
