LXI H, 2050H   ; Load address 2050H into HL register pair
MOV A, M       ; Move the decimal number from memory to accumulator

MOV B, A       ; Copy the decimal number to register B
MVI C, 00H     ; Clear register C (to store remainder)
MVI D, 10H     ; Load 16 (decimal) into register D for division

DIV_LOOP: CMP D     ; Compare A with 16
          JC STORE  ; If A < 16, store remainder and halt
          SUB D     ; Subtract 16 from A
          INR C     ; Increment C (quotient counter)
          JMP DIV_LOOP ; Repeat division

STORE:  MOV M, C    ; Store quotient at memory location 2051H
        INX H       ; Increment HL
        MOV M, A    ; Store remainder at memory location 2052H
        HLT         ; Halt the program
