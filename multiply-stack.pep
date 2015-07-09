; -------------------------------------------------------------
; Sub routine pour multiplier deux nombres en utilisant la pile
; Placer la premiere operande dans le registre A (LDA)
; et la seconde dans le registre X (LDX)
; Appeler la routine multiply (CALL)
; Le resultat s'affiche dans le registre A
; David Maignan - 07/2015
; -------------------------------------------------------------
multiply:SUBSP   6,i         
         STA     0,s
         STX     2,s
         LDA     0,i
         STA     4,s
         LDA     0,s
multwh1: ASRX
         CALL    multSub1
         CALL    multSub3
         CPX     0,i
         BREQ    multwh1E
         BR      multwh1 
multSub1:BRC     multSub2
         RET0
multSub2:ADDA    6,s
         STA     6,s
         RET0
multSub3:ASLA
         RET0
multwh1E:LDA     4,s
         ADDSP   6,i         
         RET0    