;スタックフレームの構築
push    ebp
mov     ebp, esp
;レジスタの保存
push    ecx
push    esi
push    edi
;バイト単位のコピー
cld                     ;DF=0 プラス方向
mov     edi, [ebp + 8]
mov     esi, [ebp +12]
mov     ecx, [ebp +16]

rep movsb               ;コピー処理

pop edi
pop esi
pop ecx

mov esp, ebp
pop ebp

ret