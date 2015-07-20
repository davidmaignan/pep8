         CALL    Main
         STOP
Main:    NOP1
         LDA     strlen,i
         CALL    scanf  
         RET0
scanf:   SUBSP   4,i         ;#a  
         SUBA    1,i
         CPA     0,i
         BREQ    scanfE
         STA     0,s
         LDA     0,i
         STBYTEA 2,s
         CHARI   3,s
         LDBYTEA 3,s
         CPA     '\n',i
         BREQ    scanfS
         LDA     0,s
         CALL    scanf
scanfS:  LDX     strlen,i
         SUBX    0,s
         ADDX    -1,i
         LDA     charTab,i
         STA     0,s
         LDA     0,i
         LDBYTEA 3,s
         STBYTEA 0,sxf
         ADDSP   4,i         ;#a 
         RET0
scanfE:  LDX     0,i         ;si superieur a strlen
         CALL    scanfSu1
         STBYTEA 3,sx
         ADDX    3,i
scanfE2: CALL    scanfSu1
         ADDX    6,i
         STBYTEA 0,sx
         LDA     -3,sx
         ADDA    1,i
         CPA     strlen,i
         BRNE    scanfE2
         ADDSP   4,i         ;#a
         RET0
scanfSu1:LDA     0,i
         LDBYTEA '\n',i
         RET0
;-------------------------------
; variable globales:
; tableau pour contenir chaine de characteres
; taille maximale de la chaine
;-------------------------------
charTab: .BLOCK  20          ;#1c20a
a:       .EQUATE 0           ;#1d4a
strlen:  .EQUATE 20
         .END
