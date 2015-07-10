         CALL    Main
         STOP
Main:    NOP1
         LDA     21,i
         CALL    scanf  
         RET0
scanf:   SUBSP   4,i         ;#a  
         SUBA    1,i
         CPA     0,i
         BREQ    scanfE
         STA     0,s
         CALL    scanf
scanfE:  ADDSP   4,i         ;#a 
         RET0
charTab: .BLOCK  10          ;#1c10a
         .BLOCK  11
char:    .BLOCK  1           ;#1d 
a:       .EQUATE 0           ;#2h2a
         .END
