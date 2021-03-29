memcpy:
        ;スタックフレームの構築
        push    bp
        mov     bp, sp
        ;レジスタの保存
        push    cx
        push    si
        push    di
        ;バイト単位のコピー
        cld                     ;DF=0 プラス方向
        mov     di, [bp + 4]
        mov     si, [bp + 6]
        mov     cx, [bp + 8]

        rep movsb               ;コピー処理

        pop di
        pop si
        pop cx

        mov sp, bp
        pop bp

        ret