" Section: options
" {{{

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
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Turns off search highlighting.
set nohls

" Turn on syntax highlighting.
syntax on

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
set history=500

" Set 7 lines to the curors - when moving vertical..
set scrolloff=7

" Autoread file when it changes
set autoread

" Set autoedit buffers
set hidden

" Fold settings
set foldmethod=indent
set nofoldenable

" Add cp1251 and utf8 to supported fileencodings
" set fileencodings=cp1251,utf8

" Allow to use aliases from vim :!
" set shellcmdflag=-ic

" }}}

" Section: mappings
" {{{

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Use instead Esc
inoremap jk <Esc><right>

" Shortcut for saving
nnoremap <leader>w :w!<CR>

" Shortcut for quit
nnoremap <leader>q :q<CR>

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
nnoremap <leader>r :%s///gc<left><left><left><left>

" Awesome search by ack. Use :Ack instead from ack-plugin
" nnoremap <leader>ac :! ack <right>
nnoremap <C-X> :Ack <cword><CR>
inoremap <C-X> <ESC>:Ack <cword><CR>

" Open vimrc
noremap <leader>vm :vsplit ~/.vimrc<CR>

" Delete trailing whitespaces
nnoremap <leader>tr :%s/\s\+$//e<CR>

" Paste from register 0, where yank puts
nnoremap <leader>m "0p
inoremap <leader>m "0pa

" Run Gundo plugin for look at the undo history
" nnoremap <leader>u :GundoToggle<CR>

" Shortcuts for buffers
noremap <leader>bn :bnext<CR>
noremap <leader>bp :bprevious<CR>

" Use space and backspace to navigate by page-down and page-up
noremap <Space> <C-D>
noremap <BS> <C-U>

" Map ctrl+arrow and ctrl+vimarrow to navigate split windows.
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
nnoremap <silent> <C-l> <c-w>l
nnoremap <silent> <C-h> <c-w>h
nnoremap <silent> <C-k> <c-w>k
nnoremap <silent> <C-j> <c-w>j

" Paste from clipboard
function! PasteFromClipboard()
    let p = &paste
    set paste
    execute ":r !pbpaste"
    let &paste = p
endfunction

noremap <leader>p :call PasteFromClipboard()<CR>
inoremap <leader>p :call PasteFromClipboard()<CR>

" Shortcuts to make program
set makeprg=make
command! -nargs=* Make make <args> | botright cwindow 3
noremap <C-B> :w<CR>:Make<CR>
inoremap <C-B> <ESC>:w<CR>:Make<CR>

" Shortcuts fir quickfix window
noremap <leader>o[ :cnext<CR>
noremap <leader>o] :cprevious<CR>
noremap <leader>oo :cclose<CR>

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

" In visual mode when you press * or # to search for the current selection
" vnoremap <silent> * :call VisualSearch('f')<CR>
" vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call VisualSearch('gv')<CR>
" noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

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
endif
" }}}

" Section: abbrevations
" {{{
iabbrev pacakges packages
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

" Turn on pathogen plugin
call pathogen#infect()

if has("autocmd")
    " Cpp11 syntax
    autocmd BufNewFile,BufRead *.cpp set syntax=cpp11
    
    augroup executable
        autocmd! BufWritePost * call SetExecutableMode()
    augroup END

    augroup vimrc
        " When vimrc is edited, reload it
        autocmd!
        autocmd BufWritePost .vimrc source ~/.vimrc
        autocmd BufNewFile,BufRead .vimrc set foldmethod=marker | set foldenable
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

