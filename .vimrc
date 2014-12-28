" Section: options
" {{{

" Turn on pathogen plugin
call pathogen#infect()

" This setting prevents vim from emulating the original vi's
" bugs and limitations.
set nocompatible

" The first setting tells vim to use "autoindent" (that is,
" use the current line's indent level to set the indent level of new lines).
" The second makes vim attempt to intelligently guess the indent level of
" any new line based on the previous line, assuming the source file is
" in a C-like language.
set autoindent
set smartindent

" Turn on indentation
filetype plugin indent on

" All indents are 4-spaces. Don't use tab.
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" This setting will cause the cursor to very briefly jump to
" a brace/parenthese/bracket's "match" whenever you type a closing or
" opening brace/parenthese/bracket.
set showmatch

" Turns off any errors
set noerrorbells
set novisualbell
set vb t_vb=

" Makes awesome statusline
set ruler
set laststatus=2

" Statusline
set statusline=
set statusline+=%.30F "Full path to filename
set statusline+=%{fugitive#statusline()} "Git branch info
set statusline+=%h%m%r%w " file flags
" %y -- file content type (latex, python, ...)
"%{&ff} -- file type (dos, unix, mac)
set statusline+=%= "Right alignment
set statusline+=%l/%L:%3c\ %2P "Cursor position, percentage

" Turns off search highlighting.
set nohls

" Turn on syntax highlighting.
syntax enable

" Change highlight theme to more comfortable
set background=dark

" Turn on file autosave. CTRL+Z apply this to all opened files.
set autowrite

" Highlight very long lines and trailing spaces
" highlight BAD_FORMATTING ctermbg=red
" autocmd Syntax * syntax match BAD_FORMATTING /\s\+$\|\t\|.\{79\}/ containedin=ALL

" Allow backspace to delete all symbols
set backspace=indent,eol,start

" Make set list beautiful
set listchars=tab:!\ ,eol:\$

set cpoptions=aABceFsmq
"             |||||||||
"             ||||||||+-- When joining lines, leave the cursor
"             |||||||      between joined lines
"             |||||||+-- When a new match is created (showmatch)
"             ||||||      pause for .5
"             ||||||+-- Set buffer options when entering the
"             |||||      buffer
"             |||||+-- :write command updates current file name
"             ||||+-- Automatically add <CR> to the last line
"             |||      when using :@r
"             |||+-- Searching continues at the end of the match
"             ||      at the cursor position
"             ||+-- A backslash has no special meaning in mappings
"             |+-- :write updates alternative file name
"             +-- :read updates alternative file name

" Always switch to the current file directory
" set autochdir

" None of these are word dividers
set iskeyword+=_,$,@,%,#

" Vim remembers 500 commands
set history=5000

" Set 7 lines to the curors - when moving vertical..
set scrolloff=7

" Autoread file when it changes
set autoread

" Set autoedit buffers
set hidden

" Fold settings
set foldmethod=indent
set nofoldenable

" Autocompletion properties
" Exclude include files from search space
set complete-=i

" Add cp1251 and utf8 to supported fileencodings
set fileencodings=utf-8,cp1251
set encoding=utf-8

" Allow to use aliases from vim :!
" set shellcmdflag=-ic


" Autocompletion menu colors
highlight Pmenu ctermfg=DarkGreen ctermbg=DarkGrey
highlight PmenuSel ctermfg=Green ctermbg=DarkBlue

" Search tags files in all up directories
set tags=./tags;/

" Colorscheme for MacVim
" set t_Co=256
" let g:solarized_termcolors=16
" colorscheme solarized

" Add path for find in vim
set path+=$YT_HOME/
set path+=$YT_HOME/yt/
set path+=$HOME/arcadia/trunk/arcadia/

" Do not forget to install pyflakes:
" sudo pip install pyflakes
let g:syntastic_mode_map = { 'mode': 'passive',
            \ 'active_filetypes': ['python', 'javascript'],
            \ 'passive_filetypes': [] }
" Turn it of, use simply pyflakes bundle
let g:syntastic_python_checkers = []
let g:pyflakes_use_quickfix = 0

set wildmode=longest,full
set wildmenu

" let g:clang_user_options='|| exit 0'

" }}}

" Section: mappings
" {{{

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Use instead Esc
" inoremap jk <Esc><right>

" Shortcut for saving
nnoremap <leader>w :w!<CR>
nnoremap <leader>ц :w!<CR>

" Shortcut for quit
nnoremap <leader>q :q<CR>
nnoremap <leader>й :q<CR>

" Remap increment/decrement
nnoremap <leader>- <C-X>
nnoremap <leader>= <C-A>

" Shortcut for set on/off list
nnoremap <leader>sl :setlocal list!<CR>

" Shortcut for set on/off paste
nnoremap <leader>sp :setlocal paste!<CR>

" Shortcut to expand tab
nnoremap <leader>st :setlocal expandtab!<CR>

" Switch spell checking
nnoremap <leader>ss :setlocal spell!<CR>

" Switch highlightning
nnoremap <leader>sh :setlocal hlsearch!<CR>

" Shortcut for replace
nnoremap <leader>r :%s/\<<C-r><C-w>\>//ge<left><left><left>

" Shortcut to show full path of current file
nnoremap fp <ESC>:echo expand('%:p')<CR>

" Awesome search by ack. Use :Ack instead from ack-plugin
" nnoremap <leader>ac :! ack <right>
nnoremap <C-X> :Ack <cword><CR>
inoremap <ESC><C-X> :Ack <cword><CR>

" Open vimrc
noremap <leader>vm :vsplit ~/.vimrc<CR>

" Open bashrc
noremap <leader>bh :vsplit ~/.bashrc<CR>

" Delete trailing whitespaces
nnoremap <leader>dtr :%s/\s\+$//e<CR>

" Paste from register 0, where yank puts
nnoremap <leader>m "0P
inoremap <leader>m "0Pa

" Run Gundo plugin for look at the undo history
" nnoremap <leader>u :GundoToggle<CR>

" Shortcuts for buffers
noremap <leader>bn :bnext<CR>
noremap <leader>bp :bprevious<CR>

" Use space and backspace to navigate by page-down and page-up
noremap <Space> <C-D>
" noremap <BS> <C-U>

" Map ctrl+arrow and ctrl+vimarrow to navigate split windows.
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

" Shortcuts to make program
set makeprg=make
command! -nargs=* Make make <args> | botright cwindow 5
command! -nargs=* MakeTest make test <args> | botright cwindow 7
noremap <C-B> :w<CR>:Make<CR>
inoremap <C-B> <ESC>:w<CR>:Make<CR>
noremap <leader>tt :w<CR>:MakeTest<CR>
inoremap <leader>tt <ESC>:w<CR>:MakeTest<CR>

" Shortcut to open file under cursor
nnoremap gh :vsp<CR>gf
nnoremap gb :sp<CR>gf

" Fugitive shortcuts
nnoremap <leader>gl :Glog<CR>:copen<CR>
nnoremap <leader>gb :Gblame<CR>

" Shortcuts fir quickfix window
nnoremap <leader>] :cnext<CR>
nnoremap <leader>[ :cprevious<CR>
" nnoremap <leader>o :cclose<CR>

" Fix syntax highlighting
nnoremap <leader>hg :syntax sync fromstart<CR>

" Command-T shortcut
nnoremap <silent> <leader>l :CtrlP<CR>

" Olymp shortcuts
function! OpenInputOutput(name)
    " %s/freopen/
    if a:name ==? "input"
        let input = "input.txt"
        let output = "output.txt"
    else
        let input = a:name . ".in"
        let output = a:name . ".out"
    endif
    execute "botright 7split " . output
    write
    set winfixheight
    execute "vsplit " . input
    write
    set winfixheight
    execute "normal! \<C-W>\<Up>"
endfunction

nnoremap <leader>oi :call OpenInputOutput('')<left><left>

" Execute latex
nnoremap <leader>tex :! pdflatex % && open %<."pdf"<CR>

" Compile haskell
nnoremap <leader>hs :! ghc --make %<CR>


noremap <leader>p :call PasteFromClipboard()<CR>
inoremap <leader>p :call PasteFromClipboard()<CR>

" Ctags split in vertical window
nnoremap z] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
inoremap z] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" nnoremap z[ :tn<CR>
" inoremap z[ :tn<CR> 
" nnoremap zp :tp<CR>
" inoremap zp :tp<CR>

" In visual mode when you press * or # to search for the current selection
" vnoremap <silent> * :call VisualSearch('f')<CR>
" vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call VisualSearch('gv')<CR>
" noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

function! MakeYT()
    make -C $YT_HOME/build -j16 | botright cwindow 7
endfunction

nnoremap <leader>yt :call MakeYT()<CR>

function! TestYT(...)
    if a:0 > 0
        let l:tests = a:000
    else
        let l:tests = ['*.*']
    endif
    for test in l:tests
        execute '! cd $YT_HOME/build && '.
                \ ' ./bin/unittester --gtest_filter='.test
    endfor
endfunction

function! DebugUnittest()
    Cfile ~/yt/build/bin/unittester
    Crun
endfunction

function! DebugMaster()
    Cfile ~/yt/build/bin/ytserver
    Crun --config master_config.yson --master --port 8001
endfunction

function! MakeClang()
    make -C $HOME/contrib/clang/build -j16 | botright cwindow 7
endfunction

nnoremap <leader>cl :call MakeClang()<CR>

function! SetBreakpoint()
    let number = line('.')
    let filename = expand('%:p')
    exec 'Cbreak '.filename.':'.number
endfunction

function! DeleteBreakpoint()
    let number = line('.')
    let filename = expand('%:p')
    exec 'C clear '.filename.':'.number
endfunction

" Shortcuts for Pyclewn debugger
nnoremap <F2> :call DeleteBreakpoint()<CR>
nnoremap <F3> :call SetBreakpoint()<CR>
nnoremap <F5> :Crun<CR>
nnoremap <F6> :Ccontinue<CR>
nnoremap <F7> :Cnext<CR>
nnoremap <F8> :Cstep<CR>
nnoremap <leader>va :Cdbgvar <C-R><C-W><CR>
nnoremap <leader>vf :execute "Cfoldvar " . line(".")<CR>
nnoremap <leader>vd :Cdelvar <C-R><C-W><CR>

" Ctags aliases
nnoremap z[ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
inoremap z[ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


" }}}

" Section: system-depend options
" {{{
let s:os_type = system('uname')
if match(s:os_type, "Darwin") != -1
    " Allow to copy text to clibboard using cc command
    noremap cc :w !pbcopy<CR><CR>

    " Something about encodings and russian language in vim
    set keymap=russian-jcukenwin
    set iminsert=0

    map ё `
    map й q
    map ц w
    map у e
    map к r
    map е t
    map н y
    map г u
    map ш i
    map щ o
    map з p
    map х [
    map ъ ]

    map ф a
    map ы s
    map в d
    map а f
    map п g
    map р h
    map о j
    map л k
    map д l
    map ж ;
    map э '

    map я z
    map ч x
    map с c
    map м v
    map и b
    map т n
    map ь m
    map б ,
    map ю .

    map Ё ~
    map Й Q
    map Ц W
    map У E
    map К R
    map Е T
    map Н Y
    map Г U
    map Ш I
    map Щ O
    map З P
    map Х {
    map Ъ }

    map Ф A
    map Ы S
    map В D
    map А F
    map П G
    map Р H
    map О J
    map Л K
    map Д L
    map Ж :
    map Э "

    map Я Z
    map Ч X
    map С C
    map М V
    map И B
    map Т N
    map Ь M
    map Б <
    map Ю >

    "Paste from clipboard
    function! PasteFromClipboard()
        let p = &paste
        set paste
        execute ":r !pbpaste"
        let &paste = p
    endfunction

elseif match(s:os_type, "Linux") != -1
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
    " Redirect arrows throw ssh
    map <ESC>[1;5D <C-Left>
    map <ESC>[1;5C <C-Right>
    map <ESC>[1;5A <C-Up>
    map <ESC>[1;5B <C-Down>
    map! <ESC>[1;5D <C-Left>
    map! <ESC>[1;5C <C-Right>
    map! <ESC>[1;5A <C-Up>
    map! <ESC>[1;5B <C-Down>

    " Paste from clipboard
    function! PasteFromClipboard()
        let p = &paste
        set paste
        execute "normal! \"+p"
        let &paste = p
    endfunction
endif

" }}}

" Section: abbrevations
" {{{
iabbrev pacakges packages
" }}}

" Section: vundle
" {{{
 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

Bundle 'Valloric/YouCompleteMe'

let g:ycm_global_ycm_extra_conf = '/home/ignat/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

let g:ycm_show_diagnostics_ui = 0

" }}}

" Section: autocmd and plugins
" {{{
" Add executable mode to bash and python scripts

function! SetExecutableMode()
    if getline(1) =~ "^#!"
        if getline(1) =~ "/bin/"
            silent !chmod a+x <afile>
        endif
    endif
endfunction

if has("autocmd")
    " Cpp11 syntax
    autocmd! BufNewFile,BufRead *.cpp set syntax=cpp

    " Proto syntax
    autocmd! BufNewFile,BufRead *.proto set syntax=proto

    augroup executable
        autocmd! BufWritePost * call SetExecutableMode()
    augroup END

    augroup vimrc
        " When vimrc is edited, reload it
        autocmd!
        autocmd BufWritePost .vimrc source ~/.vimrc
        autocmd BufNewFile,BufRead ~/.vimrc set foldmethod=marker | set foldenable
    augroup END

    augroup bashrc
        autocmd!
        autocmd BufWritePost .bashrc silent !. $HOME/.bashrc
    augroup END

    augroup algorithms
        autocmd BufNewFile,BufRead */github/Algorithms/*.h set foldmethod=marker | set foldenable
    augroup END

    augroup makefile
        " Show tabs in Makefiles
        autocmd! FileType make setlocal noexpandtab list
    augroup END

    " user filetype file
    if exists("did_load_filetypes")
      finish
    endif

    augroup filetypedetect
        autocmd! BufNewFile,BufRead *.applescript   setf applescript
        autocmd! BufNewFile,BufRead *.plt,*.gnuplot setf gnuplot
    augroup END

    " Turn on nice python highlight
    " let python_highlight_all = 1
    autocmd FileType python syn keyword pythonDecorator True None False self
endif

" Function! CmdLine(str)
"     exe "menu Foo.Bar :" . a:str
"     emenu Foo.Bar
"     unmenu Foo
" Endfunction
"
" From an idea by Michael Naumann
" function! VisualSearch(direction) range
"     let l:saved_reg = @"
"     execute "normal! vgvy"
"
"     let l:pattern = escape(@", '\\/.*$^~[]')
"     let l:pattern = substitute(l:pattern, "\n$", "", "")
"
"     if a:direction == 'b'
"         execute "normal ?" . l:pattern . "^M"
"     elseif a:direction == 'gv'
"         call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
"     elseif a:direction == 'f'
"         execute "normal /" . l:pattern . "^M"
"     endif
"
"     let @/ = l:pattern
"     let @" = l:saved_reg
" endfunction

" Do it better way. I want highlight only current word when make search
" noremap n n:call HighlightNearCursor()<CR>
"
" function! HighlightNearCursor()
"     match Todo /\k*\%#\k*/
" endfunction

" }}}

