       LXI H, 2001H   ; Load memory address 2001H into HL register pair
       MOV C, M      ; Load the number of elements (N) into C
       INX H         ; Increment HL to point to the first data element

SORT:  MOV B, C      ; Copy the number of elements into B for iteration
       DCR B         ; Decrement B as last element has no pair to compare
       LXI H, 2002H  ; Reset HL to point to first element after N

OUTER: MOV D, M      ; Load current element into D
       INX H         ; Move to the next element
       MOV E, M      ; Load next element into E

       CMP E         ; Compare D and E
       JC SKIP       ; If D < E, no need to swap

       MOV M, D      ; Swap elements (store D in current memory)
       DCX H         ; Move back to previous element
       MOV M, E      ; Store E in previous memory location
       INX H         ; Move forward again

SKIP:  DCR B         ; Decrement B (inner loop counter)
       JNZ OUTER     ; If B != 0, continue sorting
       DCR C         ; Decrement C (outer loop counter)
       JNZ SORT      ; If C != 0, repeat sorting

       HLT           ; Halt execution
