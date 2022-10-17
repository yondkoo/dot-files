syntax on

xnoremap p pgvy
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set number
set hlsearch
set backspace=indent,eol,start

set autoindent
set ruler
set ignorecase
set smartcase
set clipboard+=unnamed
set updatetime=300
set number relativenumber
highlight Comment ctermfg=green

inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

call plug#begin()
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'posva/vim-vue'
  Plug 'mattn/emmet-vim'
  Plug 'pangloss/vim-javascript'
  Plug 'scrooloose/nerdcommenter'
  Plug 'leafgarland/typescript-vim'
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf'
call plug#end()

let mapleader=","
let no_buffers_menu=1

nmap <c-h> :bprevious<CR>

" Window move
nmap <leader>h <C-w><LEFT>
nmap <leader>l <C-w><RIGHT>
nmap <leader>j <C-w><DOWN>
nmap <leader>k <C-w><UP>
nnoremap <silent> <space>l :5winc ><CR>
nnoremap <silent> <space>h :5winc <<CR>

nnoremap <leader>ff :Files<CR>

let g:coc_global_extensions = ['coc-tslint-plugin', 'coc-tsserver', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']

nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:coc_user_config = {}
let g:coc_user_config['coc.preferences.jumpCommand'] = ':SplitIfNotOpen4COC'

nnoremap <silent> D :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
