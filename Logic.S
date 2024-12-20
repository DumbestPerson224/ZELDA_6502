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
   ;if(player[2] < 10){
   ;   player[2]++;
   ;}
   cmp byte [player + 0x1 * 0x2], 0b1010
   jb .increment
   .increment:
     inc byte [player + 0x1 * 0x2]

_incrementEnemyLives:
   ;if(player[2] < 10){
   ;   player[2]++;
   ;}
   cmp byte [enemy + 0x1 * 0x2], 0b1010
   jb .increment
   .increment:
     inc byte [enemy + 0x1 * 0x2]

_decrementPlayerLives:
   ;if(player[2] > 0){
   ;  player[2]++;
   ;}
   cmp byte [player + 0x1 * 0x2], 0b0
   jg .decrement
   .decrement:
     dec byte [player + 0x1 * 0x2]

_incrementPlayerScore:
    ;if(player[1] < 10){
    ; player[1]++;
    ;}
    cmp byte [player + 0x1 * 0x1], 0b1010
    jb .increment
    .increment:
      inc byte [player + 0x1 * 0x2]

_incrementPlayerVelocity:
   ;if(player[3] < 0b1111111111111111){
   ; player[3]++;
   ;}
   cmp word [player + 0x2 * 0x3], 0b1111111111111111
   jb .increment
   .increment:
      inc word [player + 0x2 * 0x3]

_decrementPlayerVelocity:
  ;if(player[3] > 0){
  ; player[3]--;
  ;}
  cmp word [player + 0x2 * 0x3], 0b0 
  jg .decrement
  .decrement:
     dec word [player + 0x2 * 0x3]

_decrementEnemyLives:
    ;if(enemy[2] > 0){
    ;  enemy[2]--;
    ;}
    cmp byte [enemy + 0x1 * 0x2], 0b0
    jg .decrement
    .decrement:
       dec byte [enemy + 0x1 * 0x2]

_decrementPlayerScore:
    ;if(player[1] > 0){
    ; player[1]--;
    ;}
    cmp byte [player + 0x1 * 0x1], 0b0
    jg .decrement
    .decrement:
      dec byte [player + 0x1 * 0x1]

_incrementPlayerX:
   ;if(player[4] < 0b1111111111111111){
   ;  player[4]++;
   ;}
   cmp word [player + 0x2 * 0x4], 0b1111111111111111
   jb .increment
   .increment:
      inc word [player + 0x2 * 0x4]
