autocmd BufEnter * if &filetype == 'javascript' |nmap <F5> :w<CR>:!time node "%" <CR>| endif
autocmd FileType typescript setlocal foldmethod=syntax
function! TerraformFoldText()
  const splittedLineList = split(getline(v:foldstart), ' ')[:-2]
  let type = splittedLineList[0]
  let lineList = splittedLineList[1:]
  let txt = type . " " . join(lineList, ' ')
  return txt
endfunction
autocmd FileType terraform setlocal foldmethod=expr foldexpr=(getline(v:lnum+1)=~'^\\l'?'<1':1) foldtext=TerraformFoldText()
autocmd FileType python nmap <leader>s :PyrightOrganizeImports<CR>
autocmd FileType python,sh,typescript,gdscript3,javascript,javascriptreact,lua
  \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType css,vim,stylus,yaml,coffee,htmljinja,sh
  \ setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
