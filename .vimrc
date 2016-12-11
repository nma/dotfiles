set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-sensible'
Plugin 'kchmck/vim-coffee-script'
Plugin 'pangloss/vim-javascript'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/VimClojure'
Plugin 'altercation/vim-colors-solarized'
Plugin 'groenewege/vim-less'
Plugin 'farseer90718/vim-taskwarrior'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Brief help
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..


"
" Manual Vim Settings
"
syntax on
filetype plugin indent on

colorscheme desert
"colorscheme mayansmoke
"colorscheme pyte
"colorscheme default
"set background=dark
"colorscheme delek

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
set directory=$HOME/.vim/swaps

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:>>,eol:¬,trail:·,precedes:·,extends:>
" set list
nmap <leader>l :set list!<CR>

" pastetoggle mode settings, no annoying auto indent when pasting from clipboard
nnoremap <F2> :set invpaste paste?<CR>
imap jj <ESC>
set pastetoggle=<F2>
set showmode
" set mouse=a
set nowrap
" sets colorcolumn when lines go over 120 chars
set cc=120
set wildmode=longest,list,full
set wildmenu
"set foldmethod=syntax

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
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='ubaryd'
"let g:airline_powerline_fonts=1
" -------------------------------------------------------------------
" powerline 
" -------------------------------------------------------------------
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
" -------------------------------------------------------------------
" TagBarSettings 
" -------------------------------------------------------------------
set tags=~/mytags
" -------------------------------------------------------------------
" SyntasticSettings 
" -------------------------------------------------------------------
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
" -------------------------------------------------------------------
" Syntax coloring settings 
" -------------------------------------------------------------------
au BufRead,BufNewFile Vagrantfile set filetype=ruby

