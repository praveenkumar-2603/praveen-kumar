LXI H, 8000H  ; Load HL register pair with the starting address of the array
MOV C, M      ; Load count of numbers into register C
INX H         ; Point to the first number in the array
MOV A, M      ; Load the first number into accumulator
DCR C         ; Decrement count as first number is already considered
INX H         ; Move to the next number

LOOP: CMP M   ; Compare current number with accumulator
JC NEXT       ; If A < M, jump to NEXT
MOV A, M      ; Else, update A with the smaller number

NEXT: INX H   ; Move to next number in the array
DCR C         ; Decrement count
JNZ LOOP      ; If count not zero, repeat loop

STA 8010H     ; Store the smallest number at address 8010H
HLT           ; Halt execution
