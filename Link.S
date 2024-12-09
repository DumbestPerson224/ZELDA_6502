.segment "RODATA"
 link_health: .byte $05 ; Link Health
 link_x: .byte $0F ; Link X 
 link_y: .byte $0F ; Link Y
 link_strength: .byte $0F ; How strong Link is
 inventory: .byte $0F

_start:

  ; Load link into memory
  ldy (link_health)
  sty $0000
  ldy (link_x)
  sty $0001
  ldy (link_y)
  sty $0002
  ldy (link_strength)
  sty $0003

  ; Can increment x and y?
  lda #01 ; Yes
  sta $0004 

  ; Game over
  lda #00 ; No
  sta $0005

  ; Score
  lda #00 ; Score
  sta $0006

 ; Inventory
 lda inventory
 sta $0007

 ; Link invincible?
 lda #0
 sta $0008

_getHealthPowerUp:
  ; Get the power up
  ldx $0000
  ; Check if the health is not 10
  cpx #10
  bne .increment
  be .done
  .increment:
  inx       ; Increment X
  stx $0000 ; Store the new result
  .done:
     rts 

_getStrengthPowerUp:
 ; Get the power up
 ldx $0003
 cpx #1
 beq .increment
 bne .done
 .increment:
   inx       ; Increment X
   stx $0003 ; Store the new result
  .done:
    rts ; Return

_collided:
   ; Load the parameters
   ldx  $0001
   cpx #$0700
   rts 

   ; Check if we collided by X
   beq .collided
   bne .checkY
   .collided:
      lda $0004
      sta #00
      rts

   .checkY:
     ldx $0002
     cpx #$0701
     beq .collidedY
     bne .end
     .collidedY: 
        lda $0004
        sta #00
        jmp .end
     .end:
       rts

_getScorePowerUp:
  ldx $0005
  cpx #10
  bne .increment 
  beq .end
  .increment:
    inx 
    jmp .end
 .end:
   rts

_regenerateHealth:
  ldx $0000
  cpx #10
  bne .reset
  rts
  .reset:
    stx #10 ; Reset Link's health

_addItem: 

  ; Get the inventory system value and increment it
  ldx $0006
  cpx #$0F
  bne .increment
  beq .done
  .increment:
  inx 

  .done:
  ; Get the object and store it into the inventory
  ldx $0005
  stx $0006

_removeItem:

   ; Get the inventory system value and decrement it
   ldx $0006
   cpx #0
   bcs .decrement
   beq .done
   .decrement:
      dex
   .done:
     rts

_decrementHealth:

  ; Get the health from memory
  ldx $0000
  cpx #0
  bcs .decrement
  beq .return
  .decrement:
     dex 
  .return: 
     rts

_makeLinkInvincible:
   ldx $0000
   cpx #0
   bcs .decrement
   beq .increment
   .decrement:
     dex
   .increment:
      inx
