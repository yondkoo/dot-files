call plug#begin('~/.vim/plugged')

" Useless themes
Plug 'tomasiser/vim-code-dark'
Plug 'drewtempelmeyer/palenight.vim'

" Useful shits
Plug 'preservim/nerdtree'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf'
Plug 'arcticicestudio/nord-vim'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " this is for auto complete, prettier and tslinting
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

syntax on

set backspace=indent,eol,start
set history=200
set ruler
set showcmd
set wildmenu
set number
set clipboard+=unnamed
set noswapfile

" "set list
" "set listchars=
set listchars+=trail:·

filetype indent on
set tabstop=2
set shiftwidth=2
set expandtab
set ai

colorscheme peachpuff
" colorscheme nord
autocmd BufNewFile,BufRead *.go colorscheme codedark
autocmd BufNewFile,BufRead *.ts colorscheme palenight
autocmd BufNewFile,BufRead *.js colorscheme palenight
autocmd BufNewFile,BufRead *.vue colorscheme palenight

highlight Comment ctermfg=green

" "if &listchars ==# 'eol:$'
"  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
" "  set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
" "endif

if has('mouse')
  if &term =~ 'xterm'
    set mouse=a
  else
    set mouse=nvi
  endif
endif

nmap L :let &number=1-&number<CR>
nmap <leader>l :bnext<CR>
nmap <c-h> :bprevious<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>0 :set invnumber<CR>
nmap <leader>ps :Rg<CR>
nnoremap <silent> <C-f> :Files<CR>

" window move
nnoremap <S-h> :wincmd h<CR>
nnoremap <S-j> :wincmd j<CR>
nnoremap <S-k> :wincmd k<CR>
nnoremap <S-l> :wincmd l<CR>
nnoremap <silent> <space>l :5winc ><CR>
nnoremap <silent> <space>h :5winc <<CR>
nnoremap <silent> <C-n> :NERDTreeToggle<CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)


let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']
let NERDTreeQuitOnOpen=2
let NERDTreeIgnore=[
      \'\.jar$',
      \'\.db$',
      \'__pycache__$',
      \'node_modules',
      \'Desktop',
      \'Downloads',
      \'Documents',
      \]
