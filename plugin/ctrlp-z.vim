command! -n=* CtrlPZ cal ctrlp#init(ctrlp#z#id())
command! -n=* CtrlPF cal ctrlp#init(ctrlp#f#id())

" Put filename of bufnr into Fasd's database
fu! s:record(bufnr)
    if s:locked | retu | en
    let bufnr = a:bufnr + 0
    let bufname = bufname(bufnr)
    if bufnr > 0 && !empty(bufname)
        let fn = fnamemodify(bufname, ':p')
        let fn = exists('+ssl') ? tr(fn, '/', '\') : fn
        " Only normal file and normal buffer are recorded 
        if !empty(getbufvar('^'.fn.'$', '&bt')) || !filereadable(fn)
            retu
        else
            let cmd = 'fasd -A '.fn
            call system(cmd)
        en
    en
endf

let s:locked = 0
" Update Fasd database even when CtrlP's window is not awake
aug CtrlPZ
    au!
    au BufRead * cal s:record(expand('<abuf>', 1))
    au QuickFixCmdPre  *vimgrep* let s:locked = 1
    au QuickFixCmdPost *vimgrep* let s:locked = 0
aug END
