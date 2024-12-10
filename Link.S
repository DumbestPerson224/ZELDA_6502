.SEGMENT "RODATA"
  player_x: .byte $0F
  player_y .byte $0F
  player_lives: .byte $03 
  player_strength: .byte $0F
  inventory_system: .byte $0F

.SEGMENT "CODE"
.org $8000

_decrementLives:
  lda player_lives  
  cmp #0
  beq .done  
  clc 
  sec   ; Set carry flag
  sbc a ; Subtract accumulator by 1
  sta player_lives 
 .done:
    rts 

_incrementLives:
  lda player_lives 
  cmp #10
  beq .done  
  clc
  sec 
  adc a ; Increment the accumulator by 1
  sta player_lives  
  .done:
    rts 

_incrementStrength:
  lda player_strength 
  cmp #20
  beq .done 
  clc 
  sec
  adc a
  sta player_strength
  .done:
    rts

_decrementStrength:
  lda player_strength
  cmp #0
  beq .done 
  clc 
  sec 
  sbc a
  sta player_strength
  .done:
    rts

_incrementX:
  lda player_x 
  cmp #1000
  beq .done
  clc 
  sec 
  adc a
  sta player_x 
  .done:
    rts 

_decrementX:
  lda player_x 
  cmp #0
  beq .done 
  clc 
  sec
  sbc a
  sta player_x 
  .done:
    rts

_incrementY:
  ; Check if the player's Y axis == screen X
  lda player_y 
  cmp #1000
  beq .done 

  ; Increment player's Y axis
  clc 
  sec
  adc a

  ; Store the new value of Y into link_y
  sta player_y
  .done
    rts

_decrementY:

  ; Check if the player's Y axis > 0
  lda player_y
  cmp #0
  beq .done 
  ; Decrement the player's Y axis
  clc ; Clear carry flag
  sec
  sbc #1
  sta player_y
  .done:
    rts 
  
_inventorySystem:
  
  ; Check if the inventory is full
  lda inventory_system 
  cmp #$0F
  beq .done 
  
  ; Get the object and store it into the byte
  lda ($0004)
  sta inventory_system

  .done:
    rts

