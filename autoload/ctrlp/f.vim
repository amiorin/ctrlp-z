if exists('g:loaded_ctrlp_f') && g:loaded_ctrlp_f
  finish
endif
let g:loaded_ctrlp_f = 1

let s:f_var = {
\  'init':   'ctrlp#f#init()',
\  'exit':   'ctrlp#f#exit()',
\  'accept': 'ctrlp#f#accept',
\  'lname':  'f',
\  'sname':  'f',
\  'type':   'f',
\  'sort':   0,
\}

if exists('g:ctrlp_ext_vars') && !empty(g:ctrlp_ext_vars)
  let g:ctrlp_ext_vars = add(g:ctrlp_ext_vars, s:f_var)
else
  let g:ctrlp_ext_vars = [s:f_var]
endif

function! ctrlp#f#init()
  let ans = input('args: ')
  let cmd = 'fasd -f -l -e printf '. ans
  let pathes = split(system(cmd),"\n")
  return pathes
endfunc

function! ctrlp#f#accept(mode, str)
  call ctrlp#exit()
  if a:mode =~ 't'
      exec "tabedit ".a:str
  else
      exec "edit ".a:str
  endif
endfunction

function! ctrlp#f#exit()
endfunction

let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)
function! ctrlp#f#id()
  return s:id
endfunction
