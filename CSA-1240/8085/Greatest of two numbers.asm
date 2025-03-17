LDA 2050H     ; Load the first number from memory (2050H) into Accumulator
MOV B, A      ; Move the number from Accumulator to Register B

LDA 2051H     ; Load the second number from memory (2051H) into Accumulator
CMP B         ; Compare A with B (A - B)
JNC STORE     ; If A >= B, jump to STORE label

MOV A, B      ; If A < B, move B (greater value) into Accumulator

STORE: 
STA 2052H     ; Store the greater number at memory location 2052H
HLT           ; Halt execution
