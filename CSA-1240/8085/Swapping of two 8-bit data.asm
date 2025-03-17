LDA 1100H     ; Load the first number from memory (1100H) into Accumulator
MOV B, A      ; Move the first number from Accumulator to Register B

LDA 1101H     ; Load the second number from memory (1101H) into Accumulator
MOV C, A      ; Move the second number from Accumulator to Register C

STA 1103H     ; Store the second number (original value at 1101H) into memory location 1103H
MOV A, B      ; Move the first number (stored in B) back to Accumulator
STA 1104H     ; Store the first number (original value at 1100H) into memory location 1104H

HLT           ; Halt the program execution
