section .data
   player:
     db "0"  ; score
     db "0"  ; lives
     dw 0    ; velocity
     dw 0    ; X axis
     dw 0    ; Y axis

   enemy:
     db "0"  ; score
     db "10" ; lives

; player + 1 * 1 = player score
; player + 1 * 2 = player lives
; player + 2 * 3 = player velocity 
; player + 2 * 4 = player x axis
; player + 2 * 5 = player y axis 

; enemy  + 1 * 1 = enemy score
; enemy  + 1 * 2 = enemy lives

section .text
   global _incrementPlayerLives
   global _incrementEnemyLives
   global _decrementPlayerLives
   global _incrementPlayerScore   
   global _incrementPlayerVelocity
   global _decrementPlayerVelocity
   global _decrementPlayerScore
   global _incrementPlayerX

_incrementPlayerLives:
   cmp byte [player + 1 * 2], 0b1010
   jb .increment
   .increment:
     inc byte [player + 1 * 2]

_incrementEnemyLives:
   cmp byte [enemy + 1 * 2], 0b1010
   jb .increment
   .increment:
     inc byte [enemy + 1 * 2]

_decrementPlayerLives:
   cmp byte [player + 1 * 2], 0b0
   jg .decrement
   .decrement:
     dec byte [player + 1 * 2]

_incrementPlayerScore:
    cmp byte [player + 1 * 1], 0b1010
    jb .increment
    .increment:
      inc byte [player + 1 * 2]

_incrementPlayerVelocity:
   cmp word [player + 2 * 3], 0b1111111111111111
   jb .increment
   .increment:
      inc word [player + 2 * 3]

_decrementPlayerVelocity:
  cmp word [player + 2 * 3], 0 
  jg .decrement
  .decrement:
     dec word [player + 2 * 3]

_decrementEnemyLives:
    cmp byte [player + 1 * 2], 0b0
    jg .decrement
    .decrement:
       dec byte [enemy + 1 * 2]

_decrementPlayerScore:
    cmp byte [player + 1 * 1], 0b0
    jg .decrement
    .decrement:
      dec byte [player + 1 * 1]

_incrementPlayerX:
   cmp word [player + 1 * 4], 0b1111111111111111
   jb .increment
   .increment:
      inc word [player + 1 * 4]
