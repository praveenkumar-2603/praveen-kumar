ORG 100H    ; Origin - program starts at offset 100H

MOV AX, [1100H]  ; Load first 16-bit number from memory into AX
MOV BX, [1102H]  ; Load second 16-bit number from memory into BX
SUB AX, BX       ; Subtract BX from AX
MOV [1200H], AX  ; Store the result at memory location 1200H
HLT              ; Halt execution
