LDA 8000    ; Load first number
MOV B, A    ; Move data to B
LDA 8001    ; Load second number
SUB B       ; Subtract B from accumulator
STA 8002    ; Store result
RST 1       ; Halt