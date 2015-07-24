MAIN:    CALL    LD_NEXT          
         LDA     0,x
         CPA     -1,i        ;if last element go to sorting
         BREQ    MAIN

;Set last node to -1
         LDA     -1,i        
         STA     0,x  

;debug
         LDA     start,d
         LDX     start,d
         LDA     0,x
         STA     -2,s
         LDA     -2,sf
         STA     -4,s
         LDA     -4,sx

;Sort (bubble) linkList 
WH_ST_1: LDA     continue,d
         CPA     0,i
         BREQ    PRINT
         CALL    SETCONTI
         LDA     start,d

WH_ST_2: CALL    COMPARE
         STA     where,d

;last node - 
         LDA     where,d
         LDX     where,d
         LDA     0,x
         CPA     -1,i
         BREQ    WH_ST_1

         LDA     where,d     ;reload where b4 compare call
         BR      WH_ST_2

;Print list
PRINT:   NOP1         
         STOP
;------------------------------------------
; Load dans X le pointer vers la chaine
; Registre A: str1
; Registre X: str2
;------------------------------------------
LD_NEXT: LDA     2,i
         ADDA    where,d
         STA     -2,s
         LDX     -2,sf
         ADDX    4,i
         ADDX    where,d     ;next pointer is in X

         ;load where and save next pointer at this address
         LDA     where,d
         STA     -2,s
         STX     -2,sf
         
         ;update where to be pointer at x
         STX     where,d
         RET0
;------------------------------------------
; Compare 2 strings in A & X
; Order / check if first one
;------------------------------------------
addr1:   .EQUATE 0           ;#2h         
addr2:   .EQUATE 2           ;#2h
compteur:.EQUATE 4           ;#2h 
resultat:.EQUATE 6           ;#2h
char1:   .EQUATE 8           ;#2h
char2:   .EQUATE 10          ;#2h
COMPARE: SUBSP   12,i        ;#char2 #char1 #resultat #compteur #addr2 #addr1 
         STA     addr1,s
         LDX     addr1,sf 
         STX     addr2,s
         LDA     0,i
         STA     compteur,s
         LDA     0,i
         STA     resultat,s

CP_TAIL: LDA     compteur,s
         ADDA    1,i
         STA     compteur,s
         LDA     addr1,s 
         ADDA    2,i
         STA     -2,s
         LDA     -2,sf
         CPA     compteur,s
         BRLT    CP_E1 
         LDA     addr2,s 
         ADDA    2,i
         STA     -2,s
         LDA     -2,sf
         CPA     compteur,s
         BRLT    CP_E1 

         ;compare charactere
         LDA     compteur,s
         ADDA    3,i
         ADDA    addr1,s
         STA     char1,s

         LDA     compteur,s  
         ADDA    3,i
         ADDA    addr2,s
         STA     char2,s
         
         LDA     0,i
         LDX     0,i
         LDBYTEA char1,sf
         STX     char1,s
         STA     char1,s
         
         LDBYTEA char2,sf
         STX     char2,s
         STA     char2,s

         LDA     char1,s
         CPA     char2,s
         
         BRLT    CP_E1
         BRGT    CP_N_PLU
         BREQ    CP_TAIL     ;compaire le char suivant

CP_N_PLU:LDA     1,i
         STA     resultat,s
CP_E1:   LDA     resultat,s
         CPA     0,i
         BREQ    CP_E2
         LDA     addr1,s
         STA     addr2,sf
         LDA     addr2,s
         STA     addr1,sf

         LDA     addr1,s
         CPA     start,d
         BRNE    CP_E11
         LDA     addr2,s
         CPA     start,d         

CP_E11:  LDA     addr1,s
         ADDSP   12,i         ;#char2 #char1 #resultat #compteur #addr2 #addr1
         RET0
         
CP_E2:   LDA     addr2,s
         ADDSP   12,i         ;#char2 #char1 #resultat #compteur #addr2 #addr1 
         RET0

SETCONTI:LDA     0,i
         STA     continue,d
         RET0

;------------------------------------------
; Variables
;------------------------------------------
continue:.WORD   1           ;boolean to continue sorting
start:   .ADDRSS tab         ;pointer to the first element
where:   .ADDRSS tab         ;iterator pointer
tab:     .WORD   -1          ;list to sort
         .WORD   4
         .BYTE   'a'
         .BYTE   'a'
         .BYTE   'z'
         .BYTE   'z'
         .WORD   -1          
         .WORD   2
         .BYTE   'a'
         .BYTE   'b'
         .WORD   -2          
         .WORD   1
         .BYTE   'r'
         .END  