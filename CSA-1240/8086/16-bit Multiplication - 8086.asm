ORG 100H         ; Set origin for COM file execution

MOV SI, 1100H    ; Load address of first number into SI
MOV DI, 1102H    ; Load address of second number into DI

MOV AX, [SI]     ; Load first 16-bit number into AX
MOV BX, [DI]     ; Load second 16-bit number into BX

MUL BX           ; Perform unsigned 16-bit multiplication (DX:AX = AX * BX)

MOV [1200H], AX  ; Store the lower 16-bit result in memory (AX)
MOV [1202H], DX  ; Store the higher 16-bit result in memory (DX)

HLT              ; Halt execution
