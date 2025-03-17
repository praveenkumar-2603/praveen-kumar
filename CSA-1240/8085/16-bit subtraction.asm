LXI H, 2050H   ; Load address of first number into HL
MOV D, M       ; Move lower byte (LSB) of first number to D
INX H          ; Increment HL to point to next byte
MOV E, M       ; Move higher byte (MSB) of first number to E

LXI H, 2052H   ; Load address of second number into HL
MOV B, M       ; Move lower byte (LSB) of second number to B
INX H          ; Increment HL to point to next byte
MOV C, M       ; Move higher byte (MSB) of second number to C

MOV A, D       ; Move first number (LSB) to accumulator
SUB B          ; Subtract second number (LSB)
MOV L, A       ; Store result in L

MOV A, E       ; Move first number (MSB) to accumulator
SBB C          ; Subtract second number (MSB) with borrow
MOV H, A       ; Store result in H

LXI D, 2054H   ; Load address to store result
MOV M, L       ; Store lower byte result
INX H          ; Move to next memory location
MOV M, H       ; Store higher byte result

HLT            ; Halt execution
