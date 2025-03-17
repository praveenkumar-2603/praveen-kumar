LDA 8500    ; Load dividend
MOV B, A    ; Store in B
LDA 8501    ; Load divisor
MVI C, 00   ; Initialize C
LOOP: CMP B ; Compare
JC LOOP1    ; Jump if carry
SUB B       ; Subtract divisor
INR C       ; Increment count
JMP LOOP    ; Repeat
LOOP1: STA 8502 ; Store remainder
MOV A, C    ; Store quotient
STA 8503    ; Store quotient
HLT         ; Halt