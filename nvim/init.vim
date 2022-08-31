call plug#begin()

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', {'tag': 'v2.*'}

Plug 'dinhhuy258/git.nvim'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'fisadev/vim-isort'
Plug 'SirVer/ultisnips'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'hoob3rt/lualine.nvim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
Plug 'vimwiki/vimwiki'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'hashivim/vim-terraform'

Plug 'bluz71/vim-nightfly-guicolors'


" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'

call plug#end()


let mapleader=","
let no_buffers_menu=1

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nmap <c-h> :bprevious<CR>

" Window move
nmap <leader>h <C-w><LEFT>
nmap <leader>l <C-w><RIGHT>
nmap <leader>j <C-w><DOWN>
nmap <leader>k <C-w><UP>

" Window tab settings /I started using bufferline so, these configs are not in usage/

nnoremap <C-l>h :tabr<cr>
nnoremap <C-l>l :tabl<cr>
nnoremap <C-l>j :tabp<cr>

nnoremap <silent><leader>t <Cmd>tabnew<CR>
nnoremap <silent><leader>x <Cmd>tabc<CR>

nnoremap <silent><leader>1 <Cmd>tabn 1<CR>
nnoremap <silent><leader>2 <Cmd>tabn 2<CR>
nnoremap <silent><leader>3 <Cmd>tabn 3<CR>
nnoremap <silent><leader>4 <Cmd>tabn 4<CR>
nnoremap <silent><leader>5 <Cmd>tabn 5<CR>
nnoremap <silent><leader>6 <Cmd>tabn 6<CR>
nnoremap <silent><leader>7 <Cmd>tabn 7<CR>
nnoremap <silent><leader>8 <Cmd>tabn 8<CR>

" lua << EOF
" require("bufferline").setup{}
" EOF

" nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
" nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
" nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
" nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
" nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
" nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
" nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
" nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
" nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
" nnoremap <silent><leader>$ <Cmd>BufferLineGoToBuffer -1<CR>
" nnoremap <silent><leader>x <Cmd>BufferLineCloseLeft<CR>
" 
" nnoremap <silent>[b :BufferLineCycleNext<CR>
" nnoremap <silent>]b :BufferLineCyclePrev<CR>
" 
" " These commands will move the current buffer backwards or forwards in the bufferline
" nnoremap <silent><mymap> :BufferLineMoveNext<CR>
" nnoremap <silent><mymap> :BufferLineMovePrev<CR>
" 
" " These commands will sort buffers by directory, language, or a custom criteria
" nnoremap <silent>be :BufferLineSortByExtension<CR>
" nnoremap <silent>bd :BufferLineSortByDirectory<CR>
" nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>



nmap <leader>r :set wrap!<CR>
nnoremap <silent> <space>l :5winc ><CR>
nnoremap <silent> <space>h :5winc <<CR>

nmap <C-b> :close<CR>
imap <C-b> <ESC>:close<CR>

map <silent><F2> :NERDTreeToggle<CR>

syntax on
filetype off                           " Disable file type detection
filetype plugin on                     " Enable plugins
filetype indent on                     " Enable indent

set re=0
set number
set ruler
set noswapfile
set clipboard+=unnamed
set hls
set backspace=indent,eol,start
" set list
set wrap
 "set listchars=trail:⋅,nbsp:⋅
set ignorecase
set smartcase

" DANGER!
set termguicolors


set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
set autoindent

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set mouse=a

hi ColorColumn ctermbg=lightcyan guibg=blue
highlight Comment ctermfg=cyan

colorscheme nightfly

" colorscheme peachpuff

":1 NERDTree
"map <silent><F2> :NERDTreeToggle<CR>
map <leader>n :NERDTreeToggle<CR>

let g:NERDTreeMapOpenVSplit='a'
let g:NERDTreeCaseSensitiveSort=1
let g:NERDTreeWinPos='left'
"let g:NERDTreeQuitOnOpen=1
let g:NERDTreeChDirMode=2
let g:NERDTreeMapOpenInSilent = '<RightMouse>'
let g:nerdtree_tab_focus_on_files=1

let g:NERDTreeBookmarksFile = $HOME . '/.config/nvim/.nerdtree-bookmarks'
let NERDTreeIgnore=[
      \'node_modules',
      \'Desktop',
      \'Downloads',
      \'Dropbox',
      \'Documents',
      \'Pictures',
      \'Music',
      \'Movies',
      \]


let g:vimwiki_list = [{'path': '~/.config/vimwiki', 'path_html': '~/.config/vimwiki'}]
let g:user_emmet_leader_key=','

":2 Tab
autocmd TabEnter * silent! :execute 'cd' g:NERDTree.ForCurrentTab().getRoot().path.str()

set background=dark
"  nmap <Space> za
"  nmap <CR> za


":3 grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


"so $HOME/.config/nvim/filetype.vimrc
