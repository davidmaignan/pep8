         CALL    Main
         STOP
Main:    NOP1
         LDA     10,i
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
scanfS:  LDX     10,i
         SUBX    0,s
         ADDX    -1,i
         LDA     charTab,i
         STA     0,s
         LDA     0,i
         LDBYTEA 3,s
         STBYTEA 0,sxf
         ADDSP   4,i         ;#a 
         RET0
scanfE:  NOP1
charTab: .BLOCK  10          ;#1c10a
char:    .BLOCK  1           ;#1d 
a:       .EQUATE 0           ;#1d4a
         .END
