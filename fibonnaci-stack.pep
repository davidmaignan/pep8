;------------------------------------
; Fibonnaci 
; David Maignan - 07-2015
;------------------------------------
         LDA     12,i
         CALL    Main
         STOP
Main:    NOP1
Fibo:    CPA     2,i
         BRLE    FiboE
         SUBSP   6,i         ;#a 
         SUBA    2,i
         STA     0,s
         LDA     0,i
         STA     2,s
         STA     4,s
         LDA     1,i
         STA     4,s
FiboWh1: LDA     2,s
         ADDA    4,s
         STA     2,s
         LDA     0,s
         SUBA    1,i
         STA     0,s
         CPA     0,i
         BREQ    FiboE
         LDA     4,s
         ADDA    2,s
         STA     4,s
         LDA     0,s
         SUBA    1,i
         CPA     0,i
         STA     0,s 
         BREQ    FiboE
         BR      FiboWh1
FiboE:   LDA     2,s
         ADDA    4,s
         ADDSP   6,i         ;#a
a:       .EQUATE 0           ;#2d3a
         .END