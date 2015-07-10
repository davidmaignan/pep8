;---------------------------------------
;Fibo recursive
;---------------------------------------
         CALL    Main
         STOP
Main:    LDA     8,i
         CPA     2,i
         BRLE    FiboE
         CALL    Fibo
         Ret0
Fibo:    SUBSP   4,i         ;#val 
         SUBA    2,i
         CPA     0,i
         BREQ    Fibo2
         CALL    Fibo
Fibo2:   ADDSP   4,i         ;#val    
         Ret0
Retour:  ADDA    0,s
         RET0
FiboE:   NOP1
val:     .EQUATE 0 ;#2d2a
tab:     .EQUATE 0 ;#2d2a 
         .END