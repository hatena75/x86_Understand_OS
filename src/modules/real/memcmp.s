memcmp:
        ;スタックフレームの構築
        push    bp
        mov     bp, sp
        ;レジスタの保存
        push    bx
        push    cx
        push    dx
        push    si
        push    di
        ;引数の取得
        cld                     ;DFクリア
        mov     di, [bp + 4]
        mov     si, [bp + 6]
        mov     cx, [bp + 8]
        ;バイト単位での比較
        repe cmpsb
        jnz     .10F            ;不一致 ax=-1
        mov     ax, 0
        jmp     .10E            ;一致　ax=0
.10F:
        mov     ax, -1
.10E:
        ;ax=0

        ;レジスタの復帰等
        pop di
        pop si
        pop dx
        pop cx
        pop bx

        mov sp, bp
        pop bp

        ret