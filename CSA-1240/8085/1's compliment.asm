LDA 8000H   ; Load the number from memory address 8000H into Accumulator
CMA         ; Complement the contents of Accumulator (flip all bits)
STA 8001H   ; Store the complemented value into memory address 8001H
HLT         ; Halt the program execution
