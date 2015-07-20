;---------------------------------------------
; Memory allocation
; Load dans X la quantie de memoire necessaire
; David Maignan - 07/2015 
;---------------------------------------------
Main:    LDA     20,i 
         CALL    Alloc
         DECO    hpptr,d
         DECO    hp1,d
         CALL    Malloc
         DECO    hpptr,d 
         DECO    hp1,d
         STOP
Alloc:   LDX     hpptr,d 
         ADDA    hpptr,d
         STA     hpptr,d
         RET0
Malloc:  LDA     20,i
         SUBA    hpptr,d 
         STA     hpptr,d 
         RET0
hp1:     .ADDRSS hp
hpptr:   .ADDRSS hp          ;#1h
hp:      .BLOCK   1          ;#1h 
a:       .EQUATE 0           ;#2d4a
         .END