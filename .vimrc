set shell=/bin/bash



" vim-plug
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'preservim/tagbar'
Plug 'sjl/badwolf'
Plug 'godlygeek/tabular'
Plug 'vim-scripts/a.vim'
Plug 'vim-airline/vim-airline'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/Conque-GDB'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'https://github.com/Valloric/YouCompleteMe.git'
"Plug 'Valloric/YouCompleteMe'
Plug 'tenfyzhong/vim-gencode-cpp'
Plug 'Raimondi/delimitMate'
Plug 'christoomey/vim-tmux-navigator'
Plug 'michaeljsmith/vim-indent-object'
call plug#end()

" Run PlugInstall if there are missing plugins
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif



" Vanilla vim settings
syntax on
filetype plugin on
set nocompatible
set showcmd
set sm
set ic
set ts=4
set showmode
set ruler
set nostartofline
set hlsearch
set hidden
set wildmenu
set backspace=indent,eol,start
set ai
set t_vb=
set mouse=a
set visualbell
set confirm
set cmdheight=2
set notimeout ttimeout timeoutlen=200
set pastetoggle=<F11>
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set notimeout
set ttimeout
set timeoutlen=2000
set nowrap
set laststatus=2
set ttymouse=sgr
set incsearch
set foldmethod=manual
"set foldlevelstart=1
set nobackup
set nowritebackup
set noswapfile
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.ali,*.o,*.tgz
"set termguicolors
"set nohlsearch
set t_Co=256
inoremap {<cr> {<cr>}<c-o>O
xnoremap p pgvy
augroup CppGroup
    autocmd!
    autocmd BufEnter *.c :setlocal filetype=cpp
    autocmd BufEnter * :set number
    autocmd BufEnter * :set relativenumber
augroup END
let mapleader = ","
nnoremap <leader>vimrc :tabe ~/Documents/vimrc/.vimrc<CR>
augroup VimrcGroup
    autocmd!
    autocmd BufWritePost .vimrc source $MYVIMRC
augroup END

if has("gui_running")
	colorscheme badwolf
    " Guioptions
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=rS
    set guioptions-=L
    set termguicolors
    set guifont=Monospace\ 9
else
	colorscheme badwolf
endif

augroup remember_folds
  autocmd!
  autocmd BufWinLeave ?* silent! mkview | filetype detect
  autocmd BufWinEnter ?* silent! loadview | filetype detect
augroup END

" Alt-Mapping fix
let c='a'
while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50



" Snippets
nnoremap <leader>for :read ~/.vim/for_loop.txt<cr>V3j=fBcw



" Build & Run
nnoremap <leader>m :Make -C build -j<cr>

let cwd = getcwd()
if cwd == "/hcnat/cockpit_sim"
    nmap <leader>r :Dispatch ./build/HCNAT_CockpitSim<cr>
    nmap <leader>k :!pkill -9 HCNAT_Cock<cr><cr>:cclose<cr>
elseif cwd == "/hcnat/display_renderer"
    nnoremap <leader>r :Dispatch ./build/display_renderer ifr-4000<cr>
    nnoremap <leader>k :!pkill -9 display_r<cr><cr>:cclose<cr>
endif



" Grep
"nnoremap <leader>g :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>:Grep --color=auto -rI --exclude-dir="\.git" --exclude=\*.{ali,o,exe} --include=\*.{c,cpp,CPP,h,ads,adb,py,xml,ipp,def,dex,f,c_imp,c_file,imp,exp,xref,cscan,base} <c-r><c-w><space>
"nnoremap <leader>f :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>:Grep -rIE --exclude-dir="\.git" --exclude=\*.{ali,o,exe} --include=\*.{c,cpp,CPP,h,ads,adb,py,xml,ipp,def,dex,f,c_imp,c_file,imp,exp,xref,cscan,base} (\.\|->)*<c-r><c-w>(.)*\;*<space>
"nnoremap <leader>p :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>:Grep -rIE --exclude-dir="\.git" --exclude=\*.{ali,o,exe} --include=\*.{c,cpp,CPP,h,ads,adb,py,xml,ipp,def,dex,f,c_imp,c_file,imp,exp,xref,cscan,base} PACKAGE(.)*<c-r><c-w>(.)*IS<space>
"nnoremap <leader>e :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>:Grep -rIE --exclude-dir="\.git" --exclude=\*.{ali,o,exe} --include=\*.{c,cpp,CPP,h,ads,adb,py,xml,ipp,def,dex,f,c_imp,c_file,imp,exp,xref,cscan,base} PROCEDURE(.)*<c-r><c-w>(.)*IS<space>
"nnoremap <leader>g :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>:Ag -rI --exclude-dir="\.git" --exclude=\*.{ali,o,exe} --include=\*.{c,cpp,CPP,h,ads,adb,py,xml,ipp,def,dex,f,c_imp,c_file,imp,exp,xref,cscan,base} <c-r><c-w><space>
"vnoremap <leader>g :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>:Grep -rI --exclude-dir="\.git" --exclude=\*.{ali,o,exe} --include=\*.{c,cpp,CPP,h,ads,adb,py,xml,ipp,def,dex,f,c_imp,c_file,imp,exp,xref} @*<space>
"vnoremap <leader>g :Grep -rI --exclude-dir="\.git" --exclude=\*.{ali,o,exe} --include=\*.{c,cpp,CPP,h,ads,adb,py,xml,ipp,def,dex,f,c_imp,c_file,imp,exp,xref} @*<space>
"nnoremap <leader>g vGrep -rI --exclude-dir="\.git" --exclude=\*.{ali,o,exe} --include=\*.{c,cpp,CPP,h,ads,adb,py,xml,ipp,def,dex,f} <c-r><c-w><space>



" Save/Quit and Window/Tab Movement
nnoremap <leader>q :quitall<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <A-l> :tabnext<cr>
nnoremap <A-h> :tabprev<cr>
nnoremap <leader>T <c-w><Enter><c-w>T
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>
nnoremap <C-Q> :q!<CR>
inoremap <C-Q> <Esc>:q!<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <Esc>:w<CR><Esc>
nnoremap gb :ls<cr>:b<space>
" Cycle through buffers
"nnoremap ] :bnext<CR>
"nnoremap [ :bprevious<CR>
function! GotoJump()
    jumps
    let j = input("Please select your jump: ")
    if j != ''
        let pattern = '\v\c^\+'
        if j =~ pattern
            let j = substitute(j, pattern, '', 'g')
            execute "normal " . j . "\<c-i>"
        else
            execute "normal " . j . "\<c-o>"
        endif
    endif
endfunction
nmap <leader>j :call GotoJump()<CR>



" ====================================================== Plugins =============================================== "


" ------------------------------------------------------ NERDTree ----------------------------------------------- "
let g:NERDTreeWinSize = 35
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader><leader>n :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1



" ------------------------------------------------------ tcomment ----------------------------------------------- "
nnoremap <c-_> gcc
inoremap <c-_> <c-o>:normal gcc
vnoremap <c-_> :normal gcc



" ------------------------------------------------------ CTags/Tagbar ----------------------------------------------- "
set tags=./tags;/
nnoremap <leader>ct :!ctags -R .<CR>
nnoremap <C-F> :CtrlPTag<CR>
nnoremap <leader>b :TagbarToggle<CR>
nnoremap <leader>tn :tn<cr>
nnoremap <leader>tp :tp<cr>
nnoremap <leader>]t :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>]v :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>]h :sp <CR>:exec("tag ".expand("<cword>"))<CR>
let g:tagbar_left = 0




" -------------------------------------------------- a.vim (Header Switcher) -------------------------------------------- "
nnoremap <leader>h :A<cr>
nnoremap <leader><leader>h <c-w>v:A<cr>



" -------------------------------------------- C++ Enhanced Syntax Highlight ------------------------------------ "
let g:cpp_class_scope_highlight     = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight      = 1



" ----------------------------------------------------- Airline  ------------------------------------------------ "
let g:airline_skip_empty_sections             = 1
let g:airline_inactive_collapse               = 1
let g:airline_section_y                       = ''
let g:airline_section_b                       = ''
let g:airline_section_warning                 = ''
let g:airline#extensions#tabline#enabled      = 0
let g:airline#extensions#tabline#formatter    = 'unique_tail'
let g:airline#extensions#tabline#left_sep     = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled   = 0
let g:airline_highlighting_cache=1
"set showtabline=2


" ----------------------------------------------------- Gruvbox  ------------------------------------------------ "
let g:gruvbox_contrast_dark      = "hard"
let g:gruvbox_contrast_light     = "hard"
let g:gruvbox_vert_split         = "bg1"
"let g:gruvbox_termcolors         = 256
let g:gruvbox_bold               = 1
let g:gruvbox_italic             = 1
let g:gruvbox_italicize_comments = 0
let g:gruvbox_italicize_strings  = 0
let g:gruvbox_improved_strings   = 0
let g:gruvbox_improved_warnings  = 1
let g:gruvbox_invert_tabline     = 0
set background=dark



" ----------------------------------------------------- Conque GDB  ------------------------------------------- "
"nnoremap <leader><leader>d :ConqueGdb /avcatt/avcsimc_dev/avcsim/ah64e40/avc/suite/mm/computer/load/bin1/cpu2_seq5
let g:ConqueGdb_Leader      = '\'
let g:ConqueGdb_Run         = g:ConqueGdb_Leader . 'r'
let g:ConqueGdb_Continue    = g:ConqueGdb_Leader . 'c'
let g:ConqueGdb_Next        = g:ConqueGdb_Leader . 'n'
let g:ConqueGdb_Step        = g:ConqueGdb_Leader . 's'
let g:ConqueGdb_Print       = g:ConqueGdb_Leader . 'p'
let g:ConqueGdb_ToggleBreak = g:ConqueGdb_Leader . 'b'
let g:ConqueGdb_SetBreak    = g:ConqueGdb_Leader . 'b'
let g:ConqueGdb_Finish      = g:ConqueGdb_Leader . 'f'
let g:ConqueGdb_Backtrace   = g:ConqueGdb_Leader . 't'
let g:ConqueTerm_FastMode   = 1
nnoremap <leader>dc :ConqueGdb build/HCNAT_CockpitSim<cr>
nnoremap <leader>dr :ConqueGdb --args build/display_renderer ifr-4000 127.0.0.1 127.0.0.1 6976<cr>



" -----------------------------------------------------  Tabularize  ------------------------------------------- "
vnoremap <leader><leader>a :Tabularize /=<cr>
vnoremap <expr> -<Space> ':Tabularize /\S\(' . split(&commentstring, '%s')[0] . '.*\)\@<!\zs\ /l0<CR>'
nnoremap <expr> -<Space> ':Tabularize /\S\(' . split(&commentstring, '%s')[0] . '.*\)\@<!\zs\ /l0<CR>'
xnoremap <leader>t= :Tabularize /\[=\]<cr>
xnoremap <leader>t} :Tabularize /\v(.)*\zs}/l1c0<cr>
xnoremap <leader>t, :Tabularize /,/l0c1<cr>
nnoremap <leader>t, :Tabularize /,/l0c1<cr>



" ------------------------------------------------------- Signature ----------------------------------------------- "
"nnoremap <A-m> :SignatureListGlobalMarks<CR>
"nnoremap [ :<C-U>call signature#mark#Goto("next", "spot", "global")<CR>
"nnoremap ] :<C-U>call signature#mark#Goto("prev", "spot", "global")<CR>
"nnoremap <leader>md :delmarks A-Z0-9<cr>:wviminfo!<cr>
"let g:SignatureIncludeMarks = 'ABCDEFGHIJKLNOPRSTUVWXYZ'



" ------------------------------------------------------- EasyMotion ----------------------------------------------- "
map <leader> <Plug>(easymotion-prefix)
map <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
"nmap <leader>s <Plug>(easymotion-overwin-s)



" ------------------------------------------------------- Fzf ----------------------------------------------- "
nnoremap <C-p> :Files<cr>
nnoremap <A-b> :Buffers<cr>
nnoremap <A-n> :Lines<cr>
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'down': '40%' }
let $FZF_DEFAULT_COMMAND = "ag --ignore '\*.ali' --ignore '\*.o' --ignore '\*.exe' --ignore 'build/\*' -g ''"
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

command! -bang -nargs=* FzfGrep
  \ call fzf#vim#grep(
  \   'rg --column --line-number -g "!tags" -g "!*.ali" -g "!*.o" -g "!build" --hidden --no-heading --color="always" '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

  "\ 'csearch '.shellescape(<q-args>,1).' | rg '.shellescape((<q-args>), 1), 
command! -bang -nargs=* FzfCSearch
  \ call fzf#vim#grep(
  \ 'csearch '.shellescape(<q-args>, 1), 
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)


nnoremap <A-f> :FzfGrep <c-r><c-w><cr>
nnoremap <A-g> :FzfGrep<cr>

"command! -complete=shellcmd -nargs=+ Shell call s:RunShellCommand(<q-args>)

"function! s:RunShellCommand(cmdline)
  "echo a:cmdline
  "let expanded_cmdline = a:cmdline
  "for part in split(a:cmdline, ' ')
     "if part[0] =~ '\v[%#<]'
        "let expanded_part = fnameescape(expand(part))
        "let expanded_cmdline = substitute(expanded_cmdline, part, expanded_part, '')
     "endif
  "endfor
  "botright new
  "setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
  "call setline(1, 'You entered:    ' . a:cmdline)
  "call setline(2, 'Expanded Form:  ' .expanded_cmdline)
  "call setline(3,substitute(getline(2),'.','=','g'))
  "execute '$read !'. expanded_cmdline
  "setlocal nomodifiable
  "1
"endfunction

"command! -complete=shellcmd -nargs=+ Shell call s:ExecuteInShell(<q-args>)



" ---------------------------------------------------- YouCompleteMe ------------------------------------------------------ "
let g:ycm_global_ycm_extra_conf = '/hcnat/.ycm_extra_conf.py'
set completeopt-=preview
nnoremap <leader><leader>y :YcmCompleter FixIt<cr>


