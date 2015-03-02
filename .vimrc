set nocompatible
filetype on
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'bling/vim-airline'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-sensible'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'majutsushi/tagbar'
"Bundle 'guns/vim-clojure-static'
"Bundle 'vim-scripts/VimClojure'
Bundle 'altercation/vim-colors-solarized'
Bundle 'groenewege/vim-less'

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"
" Manual Vim Settings
"
syntax on
filetype plugin indent on

"colorscheme desert
"colorscheme mayansmoke
"colorscheme pyte
"colorscheme default
"set background=dark
colorscheme delek

set tabstop=4
set shiftwidth=4
set expandtab
"set rnu
set nu

" -------------------------------------------------------------------
" Code Formatting Settings
" -------------------------------------------------------------------
" But tab should be 2 spaces in HTML and Smarty templates
autocmd FileType html
   \ setlocal shiftwidth=2 |
   \ setlocal tabstop=2
autocmd FileType ruby
   \ setlocal shiftwidth=2 |
   \ setlocal tabstop=2
autocmd FileType python
   \ setlocal shiftwidth=4 |
   \ setlocal tabstop=4

" Settings for VimClojure
let vimclojure#HightlightBuiltins=1
let vimclojure#ParenRainbow=1

" -------------------------------------------------------------------
" Vanilla Vim Settings
" -------------------------------------------------------------------
set undodir=$HOME/.vim/undos
set backupdir=$HOME/.vim/backups
" set directory=$HOME/.vim/swaps

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬,trail:·,precedes:·,extends:>
" set list
nmap <leader>l :set list!<CR>

" pastetoggle mode settings, no annoying auto indent when pasting from clipboard
nnoremap <F2> :set invpaste paste?<CR>
imap jj <ESC>
set pastetoggle=<F2>
set showmode
set mouse=a
set nowrap

" -------------------------------------------------------------------
" ctrlp settings
" -------------------------------------------------------------------
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 0
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

map <Tab> <c-p>

" -------------------------------------------------------------------
" NerdTreeSettings
" -------------------------------------------------------------------
nmap <silent> <C-t> :NERDTreeToggle <CR>
" -------------------------------------------------------------------
" vim-airline 
" -------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='ubaryd'
let g:airline_powerline_fonts=1

set tags=~/mytags

