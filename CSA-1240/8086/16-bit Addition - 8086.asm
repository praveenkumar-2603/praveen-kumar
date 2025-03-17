ORG 100H       ; Set origin for COM file execution

MOV SI, 1100H  ; Load address of first number into SI
MOV DI, 1102H  ; Load address of second number into DI

MOV AX, [SI]   ; Load first 16-bit number into AX
MOV BX, [DI]   ; Load second 16-bit number into BX

ADD AX, BX     ; Perform 16-bit addition (AX = AX + BX)

MOV [1200H], AX ; Store the result at memory location 1200H

HLT            ; Halt execution
