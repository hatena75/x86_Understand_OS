        BOOT_LOAD       equ     0x7C00  ;ブートプログラムのロード位置

        ORG     BOOT_LOAD               ;アセンブラにロードアドレスを指示

entry:
        jmp     ipl     ;IPLへジャンプ
        ;BPB
        times   90 - ($ - $$) db 0x90
        ;IPL
ipl:
        cli                             ;// 割り込み禁止

        mov     ax, 0x0000
        mov     ds, ax
        mov     es, ax
        mov     ss, ax
        mov     sp, BOOT_LOAD

        sti                             ;// 割り込み許可

        mov     [BOOT.DRIVE], dl        ;ブートドライブの保存

        ;処理の終了
        jmp     $       ;無限ループ

ALIGN 2, db 0                           
BOOT:                                   ;ブートドライブに関する情報
.DRIVE:         dw 0                    ;ドライブ番号

        ;ブートフラグ
        times   510 - ($ - $$) db 0x00
        db 0x55, 0xAA