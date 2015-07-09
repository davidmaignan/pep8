; -------------------------------------------------------------
; Sub routine pour diviser deux nombres en utilisant la pile
; Placer la premiere operande dans le registre A (LDA)
; et la seconde dans le registre X (LDX)
; Appeler la routine divide (CALL)
; Le resultat et le reste sont sauves dans le tableau divTab 
; 0: quotient - 2: reste
; David Maignan - 07/2015
; -------------------------------------------------------------
divide:  SUBSP   8,i         ;#a 
         STA     0,s         
         STX     2,s
         LDA     0,i
         STA     4,s
         LDA     divTab,i
         STA     6,s
divWh01: ASLX    
         CPX     0,s
         BRLE    divWh01
         ASRX
         STX     4,s
divWh02: LDA     0,s
         CPA     4,s
         BRLT    divIf01
         SUBA    4,s
         CALL    divSub1
         ADDA    1,i
         STA     6,sf
         BR      divthen1         
divIf01: CALL    divSub1
         STA     6,sf
divthen1:ASRX
         CPX     2,s
         BRLT    divideE
         STX     4,s
         BR      divWh02
divSub1: STA     2,s
         LDA     8,sf
         ASLA
         RET0
divideE: LDA     0,s
         LDX     2,i
         STA     6,sxf
         ADDSP   8,i         ;#a 
         RET0 
;-----------------------------------
; variables a ajouter au script 
; principal
;-----------------------------------
divTab:  .BLOCK  4           ; #2d2a 
a:       .EQUATE 0           ; #2d4a
         .END  