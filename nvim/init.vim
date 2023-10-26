syntax on
set nocompatible
set showmatch
set ignorecase
set mouse=v
set mouse=a
set hlsearch
set incsearch

" set listchars=tab:\|\
" set list

set expandtab       "Use softtabstop spaces instead of tab characters for indentation
set shiftwidth=4    "Indent by 4 spaces when using >>, <<, == etc.
set softtabstop=4   "Indent by 4 spaces when pressing <TAB>
set autoindent      "Keep indentation from previous line
set smartindent     "Automatically inserts indentation in some cases
set cindent         "Like smartindent, but stricter and more customisable

"set cursorline
set number
set wildmode=longest,list
set background=dark
set updatetime=100
filetype plugin indent on
filetype plugin on
set clipboard=unnamedplus
set ttyfast
set noswapfile
hi! link NormalFloat Normal

let mapleader="w"

" move between panes to left/bottom/top/right
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

call plug#begin()
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
Plug 'nvim-lua/plenary.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'jvirtanen/vim-hcl'
Plug 'yggdroot/indentLine'
Plug 'Yggdroot/indentLine'
call plug#end()

highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

nnoremap <C-f> :NERDTreeFind<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>


if has ("autocmd")
    " File type detection. Indent based on filetype. Recommended.
    filetype plugin indent on
endif

autocmd BufNewFile,BufRead *[jJ]enkinsfile set syntax=groovy

function! CustomSum()
        let sum = 0
        for l in range( 1, line('$') )
                let fields = split( getline(l), '\s*=\s*' )
                if ( len( fields ) != 2 || fields[1] =~? '\D' )
                        continue
                endif
                let sum = sum + fields[1]
        endfor
        return sum
endfunction
