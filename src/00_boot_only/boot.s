;   何もしないブートプログラム
entry:                                  ;while(1)と同等
        jmp     $
;   ブートフラグ(先頭512バイトの終了)
        times   510 - ($ -$$) db 0x00
        db      0x55, 0xAA