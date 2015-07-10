new:     LDX     hpptr,d
         ADDA    hpptr,d
         STA     hpptr,d
         RET0
hpptr:   .ADDRSS hp
hp:      .BYTE   0