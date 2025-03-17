LDA 3000H   ; Load the number from memory address 3000H into Accumulator
CMA         ; Take 1’s complement (invert all bits)
ADI 01H     ; Add 1 to get 2’s complement
STA 3001H   ; Store the 2’s complement result at memory address 3001H
HLT         ; Halt the program execution
