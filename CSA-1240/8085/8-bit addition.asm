LDA 8050    ; Load accumulator with first number
MOV B, A    ; Move accumulator data to B register
LDA 8051    ; Load accumulator with second number
ADD B       ; Add B register to accumulator
STA 8052    ; Store result
HLT         ; Halt the program