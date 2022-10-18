syntax on

xnoremap p pgvy

set mouse=a
set hidden
set modelines=0
set smarttab
set showmatch
set scrolloff=3
set wildmenu
set wildmode=list:longest
set background=dark

set lazyredraw
set ttyfast
set ruler
set wrap
set textwidth=79
set formatoptions=qrn1
set fileformat=unix
set cmdheight=1
set updatetime=300
set splitbelow

set tabstop=2
set shiftwidth=2
set expandtab
set shiftround
set ai
set number
set backspace=indent,eol,start
set nobackup

set autoindent
set copyindent
set ruler
set ignorecase
set smartcase
set hlsearch
set incsearch
set clipboard+=unnamed
set updatetime=300
set number relativenumber

set title
set novisualbell
set noerrorbells
set guifont=PragmataProLiga-Regula:h18
set encoding=utf-8
set showmode
set showcmd

"highlight Comment ctermfg=cyan

inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

set laststatus=2
set statusline=

" file name
set statusline +=%t
" modified flag
set statusline +=\ %#todo#%m%*
" right aligned from here
set statusline +=%=
" current line/total lines and column
set statusline +=[%3l/%-3L\|%-2c]
" file type
set statusline +=\ %Y

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
  Plug 'cloudhead/shady.vim'
call plug#end()

let mapleader=","
let no_buffers_menu=1

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 20

" step line by line even when text is wrapped
nnoremap j gj
nnoremap k gk

" clear search highlights
nmap <silent> <leader><space> :nohlsearch<cr>

" use w!! to use sudo after opening
cmap w!! w !sudo tee % > /dev/null

" fire netrw
map <silent>N :Vexplore<CR>

" jump previous buffer
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
    call feedkeys('D', 'in')
    "call feedkeys('K', 'in')
  endif
endfunction

"augroup ProjectDrawer
  "autocmd!
  "autocmd VimEnter * :Vexplore
"augroup END

" Per file-type indentation (co-workers get mad at me sometimes)
au FileType                     haskell         setlocal sts=4 sw=4 expandtab
au FileType                     elm             setlocal sts=4 sw=4 expandtab
au FileType                     javascript      setlocal fo=cqt sts=2 sw=2 tw=80 wm=0 expandtab
au FileType                     css             setlocal ts=2  sw=2 noexpandtab
au FileType                     go              setlocal ts=4  sw=4 noexpandtab
au BufNewFile,BufRead,FileType  *.go            setlocal ts=4  sw=4 noexpandtab
au FileType                     c,cpp,glsl      setlocal ts=8  sw=8 noexpandtab
au FileType                     lua             setlocal       sw=4 expandtab
au FileType                     sh,zsh          setlocal ts=2  sw=2 noexpandtab
au FileType                     vim,ruby        setlocal sts=2 sw=2 expandtab
au FileType                     help            setlocal ts=4  sw=4 noexpandtab
au FileType                     txt             setlocal noai nocin nosi inde= wrap linebreak
au FileType                     pandoc          setlocal nonumber
au FileType                     markdown        setlocal nonumber
au FileType                     fountain        setlocal nonumber noai nocin nosi inde= wrap linebreak
au BufNewFile,BufReadPost       *.md            set filetype=markdown
au BufNewFile,BufRead           *.tsx,*.jsx     set filetype=typescriptreact

