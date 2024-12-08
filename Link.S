.segment "RODATA"
 link_health: .byte $05 ; Link Health
 link_x: .byte $0F ; Link X 
 link_y: .byte $0F ; Link Y
 link_strength: .byte $0F ; How strong Link is
_start:

  ; Load link into memory
  ldy link_health
  sty $0000
  ldy link_x
  sty $0001
  ldy link_y
  sty $0002
  ldy link_strength
  sty $0003

_getHealthPowerUp:
  ; Get the power up
  ldx $0000
  ; Check if the health is not 10
  cpx #10
  bne .increment
  .increment:
  inx       ; Increment X
  stx $0000 ; Store the new result
  rts 

_getStrengthPowerUp:
 ; Get the power up
 ldx $0003
 cmp x, #1
 beq .increment
 .increment:
   inx       ; Increment X
   stx $0003 ; Store the new result
   rts ; Return
