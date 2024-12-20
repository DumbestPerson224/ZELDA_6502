section .data
   player:
     db "0"  ; score
     db "0"  ; lives
     dw 0    ; velocity
   enemy:
     db "0"  ; score
     db "10" ; lives
     
section .text
   global _incrementPlayerLives
   global _incrementEnemyLives
   global _decrementPlayerLives
   global _incrementPlayerScore   
   global _incrementPlayerVelocity
   global _decrementPlayerVelocity
   global _decrementPlayerScore

_incrementPlayerLives:
   cmp byte [player + 1 * 2], 10
   jb .increment
   .increment:
     inc byte [player + 1 * 2]

_incrementEnemyLives:
   cmp byte [enemy + 1 * 2], 10
   jb .increment
   .increment:
     inc byte [enemy + 1 * 2]

_decrementPlayerLives:
   cmp byte [player + 1 * 2], 0
   jg .decrement
   .decrement:
     dec byte [player + 1 * 2]

_incrementPlayerScore:
    cmp byte [player + 1 * 1], 10
    jb .increment
    .increment:
      inc byte [player + 1 * 2]

_incrementPlayerVelocity:
   inc word [player + 2 * 3]

_decrementPlayerVelocity:
  dec word [player + 2 * 3]

_decrementEnemyLives:
    cmp byte [player + 1 * 2], 0
    jg .decrement
    .decrement:
       dec byte [enemy + 1 * 2]

_decrementPlayerScore:
    cmp byte [player + 1 * 1], 0
    jg .decrement
    .decrement:
      dec byte [player + 1 * 1]
