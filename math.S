_multiply:
     lda $0000 
     ldx $0001
     ldy $0002
     cpy #0
     beq .done 
     clc 
     adc (x)
     dey
     jsr _multiply
     .done:
          ; Store new value 
          lda (x)   ; Get the new value
          sta $0000 ; Store the new value at $0000
          rts