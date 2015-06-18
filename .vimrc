set textwidth=125
set nocompatible
set backspace=2
set smartindent
filetype on
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-sensible'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'

"
" Brief help
" :PluginList          - list configured Plugins
" :PluginInstall(!)    - install(update) Plugins
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused Plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin command are not allowed..

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" Manual Vim Settings
"
syntax on
filetype plugin indent on

set t_Co=256
set encoding=utf-8
set termencoding=utf-8
colorscheme desert
"colorscheme mayansmoke
"colorscheme pyte
"colorscheme default
"set background=dark

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
"  <leader> = '\'
set backupdir=$HOME/.vim/backups
" set directory=$HOME/.vim/swaps
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undos
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo

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
set cc=120
autocmd BufNewFile,BufRead *.java set cc=160

" buffer switch
set switchbuf=usetab
nnoremap <F8> :sbnext<CR>
nnoremap <S-F8> :sbprevious<CR>
nnoremap <Space> za

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
let g:NERDTreeDirArrows=0
" -------------------------------------------------------------------
" TagBarSettings 
" -------------------------------------------------------------------
nnoremap <silent> <Leader>b :TagbarToggle<CR>
" -------------------------------------------------------------------
" vim-airline 
" -------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='ubaryd'
let g:airline_powerline_fonts=1
" -------------------------------------------------------------------
" Syntastic settings
" -------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 0

let g:syntastic_mode_map = {
    \ "mode": "active",
    \ "active_filetypes": ["ruby", "python", "php", "perl"],
    \ "passive_filetypes": ["java", "go"] }
