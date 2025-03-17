LXI H, 8050H    ; Load memory address 8050H into HL register pair
MOV C, M        ; Load the counter (number of elements) into register C
INX H           ; Move to the first data element
MOV B, M        ; Assume first number as the largest
DCR C           ; Decrement counter since we already loaded first element

LOOP: INX H     ; Move to the next element
MOV A, M        ; Load the next number into Accumulator
CMP B           ; Compare A (current number) with B (largest so far)
JC SKIP         ; If A < B, skip updating B
MOV B, A        ; Update B with the new largest number

SKIP: DCR C     ; Decrement counter
JNZ LOOP        ; If counter is not zero, continue looping

LXI H, 8500H    ; Load memory address 8500H
MOV M, B        ; Store the largest number in memory
HLT             ; Halt the program
