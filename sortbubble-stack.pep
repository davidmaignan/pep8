;----------------------------
;Bubble sort 
;Routine pour trier un tableau
;par refernece
;----------------------------
         LDX     0,i         
         LDA     5,i
         STA     sortTab,x  
         ADDX    2,i
         LDA     8,i
         STA     sortTab,x
         ADDX    2,i
         LDA     2,i
         STA     sortTab,x
         ADDX    2,i
         LDA     6,i
         STA     sortTab,x
         ADDX    2,i
         LDA     3,i
         STA     sortTab,x
         CALL     Main 
         STOP
Main:    LDA     10,i
sort:    SUBSP   8,i         ; empile un mot #a 
         STA     2,s
         LDA     0,i        
         STA     0,s 
         LDA     sortTab,i
         STA     4,s        
sortWh1: LDA     0,s
         CPA     1,i
         BREQ    sortWH1E  
         CALL    sortSub1
         LDX     0,i
sortWh2: NOP1
         LDA     4,sxf
         ADDX    2,i
         CPX     2,s
         BREQ    sortWh1
         CPA     4,sxf
         BRGT    sortInvt
         BR      sortWh2
sortInvt:STA     6,s
         LDA     4,sxf
         SUBX    2,i
         STA     4,sxf
         ADDX    2,i
         LDA     6,s
         STA     4,sxf
         CALL    sortSub2
         BR      sortWh2
sortSub1:LDA     1,i
         STA     b,s
         RET0
sortSub2:LDA     0,i
         STA     b,s
         RET0
sortWH1E:ADDSP   8,i         ; dépile un mot #a

;------------------------------------
; Reference pour du tableau a trier
;------------------------------------
sortTab: .BLOCK  10          ; #2d5a  
a:       .EQUATE 0           ; #2d4a
b:       .EQUATE 2           
         .END