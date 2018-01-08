call plug#begin()
" NERDTree
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Airline - bottom status line
Plug 'vim-airline/vim-airline'

" Vim surround - parentheses closing
Plug 'tpope/vim-surround'

" Ctrlp - Fuzzy file search
Plug 'kien/ctrlp.vim'

" Ag - Text search
Plug 'rking/ag.vim'

" Themes
Plug 'mhartington/oceanic-next'

" Better Whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Emmet
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'javascript.jsx'] }

" Git wrapper
Plug 'tpope/vim-fugitive'

" Slim syntax highlighting
Plug 'slim-template/vim-slim', { 'for': ['slim'] }
call plug#end()

" General settings
set title                                     " Change terminal title
set number                                    " Show line number
set history=500                               " :cmdline history size
set showcmd                                   " Show completions for cmds
set noshowmode                                " Hide mode because airline shows it
set gcr=a:blinkon500-blinkwait500-blinkoff500 " Set cursor blinking rate
set cursorline                                " Highlight current line
set smartcase                                 " Smart case search if there is uppercase
set ignorecase                                " Case insensitive search
set mouse=a                                   " Enable mouse interaction
set showmatch                                 " Highligh matching bracket
set nostartofline                             " Jump to non-blank char
set timeoutlen=1000 ttimeoutlen=0             " Reduce Command timeout for faster escape and O
set fileencoding=utf-8                        " Set utf-8 encoding on write
set wrap                                      " Enable word wrap
set linebreak                                 " Wrap lines at convenient points
set listchars=tab:»\ ,space:·                 " Set representation for whitespaces
set list                                      " Enable listchars
set tags=.tags                                " Tags files
set termguicolors                             " Enable terminal true colors
syntax enable                                 " Turn on sintax highlighting
colorscheme OceanicNext                       " Set theme

" Turn off swap files
set noswapfile
set nobackup
set nowb

" Persistent undo
silent !mkdir ~/.config/nvim/backups > /dev/null 2>&1
set undodir=~/.config/nvim/backups
set undofile

" Indentation settings
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set smartindent
set nofoldenable
set colorcolumn=120

" Auto commands
augroup vimrc
  autocmd!
augroup END

autocmd vimrc BufWritePre * :StripWhitespace   " Remove trailing whitespaces
autocmd vimrc InsertEnter * :set nocul         " Remove cursorline highlight on insert mode enter
autocmd vimrc InsertLeave * :set cul           " Add current line highlighting on insert mode leave
autocmd vimrc FocusGained,BufEnter * checktime " Refresh file when vim gets focus

" Leader remapping
let mapleader = '\'

" Ag settings
map <Leader>s :Ag<Space>

" NERDTree settings
let NERDTreeWinPos = 'left'
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>a :NERDTreeFind<CR>

" Search
nnoremap <Leader>f /

" Hide search highlighting
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Copy and paste from/to system clipboard
vnoremap <C-c> "+y
inoremap <C-v> <Esc>"+pa

" Move selected lines up and down
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '>-2<CR>gv=gv

" Tabs in normal and visual mode
nnoremap <tab> >>
nnoremap <s-tab> <<

" Tabs in visual mode
xnoremap <tab> >gv
xnoremap <s-tab> <gv

" Center highlighted search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz

" Move between panes
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Block movements on normalmode
map <up> <NOP>
map <down> <NOP>
map <left> <NOP>
map <right> <NOP>


" Plugins settings

" Ag
let g:ag_prg='ag -S --nocolor --nogroup --column --ignore "./node_modules/*" --ignore "./log/*"'
