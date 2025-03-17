LXI H, 8000H    ; Load the memory address 8000H into HL pair
MOV C, M        ; Store the number count from 8000H into register C
DCR C           ; Decrease the counter by 1 (as sorting requires n-1 passes)

LOOP3: MOV D, C  ; Copy C to D (Loop counter for inner loop)
LXI H, 8001H    ; Load the starting address of the array into HL

LOOP2: MOV A, M  ; Load the current element into Accumulator
INX H           ; Move to the next memory location
CMP M           ; Compare Accumulator with next element
JC LOOP1        ; If A < M, no swap needed, jump to LOOP1

MOV B, M        ; Swap needed, move next element into B
MOV M, A        ; Store A at current location
DCX H           ; Move back to the previous location
MOV M, B        ; Store B (original next element) in the previous location

INX H           ; Move forward again

LOOP1: DCR D    ; Decrease inner loop counter
JNZ LOOP2       ; If not zero, repeat inner loop

DCR C           ; Decrease outer loop counter
JNZ LOOP3       ; If not zero, repeat outer loop

HLT             ; Halt the program
