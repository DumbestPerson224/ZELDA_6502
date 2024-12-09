.segment "RODATA" 
  boss_health: .byte $05 ; BOSS HEALTH
  boss_x: .byte $0F
  boss_y: .byte $0F    

_start:
  ; Load the boss into memory
  lda boss_health
  sta $0005
  lda boss_x
  sta $0006
  lda boss_y
  sta $0007

_decrementLinkHealth:
   lda $0000
   cmp #0
   bne .decrement
   beq .done
   .decrement:
     dec a
     rts

  .done:
    ; Update game over flag
    lda $0005
    sta #01
    rts
