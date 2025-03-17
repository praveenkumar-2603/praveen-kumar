LXI H, 8050H   ; Load HL with the starting address of the array
MOV C, M       ; Move the count value (number of elements) to register C
INX H          ; Increment HL to point to the first data element
MOV B, M       ; Move the first element into register B (assume it's the smallest)
DCR C          ; Decrement counter as the first element is already considered

LOOP: INX H    ; Increment HL to point to the next element
MOV A, M       ; Move the current element into accumulator
CMP B          ; Compare A with B
JNC SKIP       ; If A >= B, skip updating B
MOV B, A       ; If A < B, update B with A

SKIP: DCR C    ; Decrement the counter
JNZ LOOP       ; If counter is not zero, repeat the loop

LXI H, 8500H   ; Load HL with output address
MOV M, B       ; Store the smallest number at 8500H
HLT            ; Halt the program
