" Chris Schilling .vimrc

" Vundle plugin installer
" :PluginInstall
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim' " Plugin Manager
Plugin 'tpope/vim-fugitive' " Git Wrapper
Plugin 'vim-airline/vim-airline' " Lower status bar
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'tpope/vim-rails' " Ruby on Rails
Plugin 'scrooloose/nerdtree' " File Explorer
Plugin 'tomtom/tcomment_vim' " Easier Code Commenting
" Plugin 'tpope/vim-surround' " Easier surround with brackets
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tpope/vim-repeat' " Help . command work with plugin operations
Plugin 'Valloric/YouCompleteMe'
Plugin 'jiangmiao/auto-pairs' " Auto pairing of quotes/brackets etc.
Plugin 'vim-ruby/vim-ruby' " Ruby Extensions
Plugin 'ervandew/supertab' " Better Tab completion
Plugin 'scrooloose/syntastic' " Syntax Checking
Plugin 'kien/ctrlp.vim'
"Plugin 'tacahiroy/ctrlp-funky'
" Plugin 'davetron5000/java-javadoc-vim'
Plugin 'octol/vim-cpp-enhanced-highlight' " Better C++ syntax highlighting
Plugin 'justinmk/vim-syntax-extra' " Better syntax highlighting everywhere
"Plugin 'jelera/vim-javascript-syntax' " Better JavaScript syntax highlighting
Plugin 'pangloss/vim-javascript'
" Plugin 'sentientmachine/erics_vim_syntax_and_color_highlighting'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'vim-utils/vim-ruby-fold'
Plugin 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on
silent !stty -ixon > /dev/null 2>/dev/null
set omnifunc=syntaxcomplete#Complete
syntax enable
"call togglebg#map("<F5>")

" Syntastic Recommended Settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_auto_loc_height = 5
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
" Syntastic Checkers
"let g:syntastic_ruby_checkers = ['mri']
"let g:syntastic_c_checkers = ['gcc']
"let g:syntastic_css_checkers = ['csslint']
"let g:syntastic_html_checkers = ['jshint']
"let g:syntastic_java_checkers = ['javac']


let mapleader = ","
set mouse:a
set background=light
set hlsearch
set nu
set smartindent
set expandtab
"hi Normal ctermbg=none
filetype on
" Tab Indentation
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2
"Treat all numerals as decimal instead of octal even with 0 padding
set nrformats=

" Auto-Pairs FlyMode
let g:AutoPairsFlyMode = 0
"nnoremap i] i]<Esc>
"inoremap i] ]
"nnoremap i) i)<Esc>
"inoremap i) )

" Syntax Highlighting
set t_Co=256
colorscheme lucius
au BufReadPost *.twig colorscheme lucius 
au BufReadPost *.css colorscheme lucius 
au BufReadPost *.js colorscheme lucius 
au BufReadPost *.py colorscheme lucius
au BufReadPost *.html colorscheme lucius
au BufReadPost *.cpp colorscheme lucuis
au BufReadPost *.c colorscheme lucius
au BufReadPost *.h colorscheme lucius
au BufReadPost *.hs colorscheme lucius
au BufReadPost *.php colorscheme lucius
au BufReadPost *.java colorscheme lucius
autocmd FileType java colorscheme lucius

"Disable Search Highlighting
set nohlsearch

set pastetoggle=<F2>
set clipboard=unnamed

" Disable swap files
set nobackup
set nowritebackup
set noswapfile

" Unmap the Arrow Keys
no <down> <Nop>
no <left> <Nop>
no <right> <Nop>
no <up> <Nop>
ino <down> <Nop>
ino <left> <Nop>
ino <right> <Nop>
ino <up> <Nop>

" Various Mappings
"   Window Movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Write and Quit
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>
nnoremap <C-Q> :q!<CR>
inoremap <C-Q> <Esc>:q!<CR>
nnoremap <C-w> :w<CR>
inoremap <C-w> <Esc>:w<CR><Esc>
"command! -bar -bang Q quit<bang>

" Cycle through buffers
nnoremap ] :bnext<CR>
nnoremap [ :bprevious<CR>

" Leader Binds
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>
nnoremap <leader>n :NERDTree<CR>

" Fix Block - Fixes if/else to have brackets for single branch command
inoremap <leader>fb <Esc>kA{<CR><Esc>ddA<CR>}<Esc>=
nnoremap <leader>fb kA{<CR><Esc>ddA<CR>}<Esc>=


" Paste-mode Toggle
set pastetoggle=<F10>

" Makefile Shortcuts
nnoremap <leader><leader>m :make!<CR>
inoremap <leader><leader>m <Esc>:make!<CR>
nnoremap <leader><leader>r :make!<space>run<CR>
inoremap <leader><leader>r <Esc>:make!<space>run<CR>
nnoremap <leader><leader>t :make!<space> test<CR>
inoremap <leader><leader>t <Esc>:make!<space> test<CR>
nnoremap <leader><leader>c :make!<space> clean<CR>
inoremap <leader><leader>c <Esc>:make!<space> clean<CR>

" Shift-K Manuals
autocmd FileType cpp set keywordprg=cppman

"Java Development Keybinds
autocmd FileType java set keywordprg=
" System.out.println("")  mapping
nnoremap <leader><leader>sys iSystem.out.println("");<Esc>hhi
inoremap <leader><leader>sys System.out.println("");<Esc>hhi
" Integer.parseInt() mapping
nnoremap <leader><leader>ipi iInteger.parseInt();<Esc>hi
inoremap <leader><leader>ipi Integer.parseInt();<Esc>hi

"Code Folding
autocmd BufReadPost * hi Folded ctermfg=darkgray
hi Folded ctermfg=darkgray
set foldmethod=indent   "fold based on indent
set foldnestmax=30      "deepest fold is 30 levels
set foldlevel=1         "this is just what i use
set nowrap
"  Save folds and cursore position between sessions
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadvie
"  Space to toggle current fold. If not a fold, move right.
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
"  Visually selected code fold with space
vnoremap <Space> zf


" Vim-Minimap Highlight Color
let g:minimap_highlight='Special'

" NerdTree
let g:NERDTreeWinSize = 17

" Easy-Motion
map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion"
" nmap <leader> <Plug>(easymotion-prefix)
" nmap t <Plug>(easymotion-s2)

" Enable <C-x><C-k> dictionary autocompletion
set dictionary+=/usr/share/dict/words

" For loop shortcuts
nnoremap <leader><leader>for ifor<space>(int<space>i<space>=<space>0;<space>i<space><<space>x;<space>i++){}<ESC>i<CR><ESC>k20lxi
inoremap <leader><leader>for for<space>(int<space>i<space>=<space>0;<space>i<space><<space>x;<space>i++){}<ESC>i<CR><ESC>k20lxi

" Autocompletion
inoremap <leader>. .<c-x><c-o>

" Ctags
nnoremap <silent> <Leader>b :TagbarToggle<CR>
nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>ct :!ctags -R .<CR>
