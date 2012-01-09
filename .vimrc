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

" Allow to copy text to clibboard using cc command
map cc :w !pbcopy

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

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Shortcut for saving
nmap <leader>w :w!<CR>

" Shortcut for set on/off list
map <leader>sl :set list!<CR>

" Shortcut for set on/off paste
nnoremap <leader>sp :set paste!<CR>

" Shortcut to expand tab
nnoremap <leader>st :set expandtab!<CR>

" Switch spell checking
nnoremap <leader>ss :set spell!<CR>

" Shortcut for replace
nnoremap <leader>r :%s///gc<left><left><left><left>

" Awesome search by ack
nnoremap <leader>ac :! ack <right>

" Run Gundo plugin for look at the undo history
nnoremap <leader>u :GundoToggle<CR>

" Delete trailing whitespaces
nnoremap <leader>en :%s/\s\+$//e<CR>

" Map ctrl+arrow to navigate split windows.
" At first we need aliases to redirect command through ssh
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j


" Shortcuts to make program
set makeprg=make
noremap <C-B> :w<CR>:make<CR>
inoremap <C-B> <ESC>:w<CR>:make<CR>

" Use space and backspace to navigate by page-down and page-up
noremap <Space> <C-D>
noremap <BS> <C-U>

" Olymp shortcuts
function! OpenInputOutput(name)
    if a:name ==? "input"
        let input = "input.txt"
        let output = "output.txt"
    else
        let input = a:name . ".in"
        let output = a:name . ".out"
    endif
    execute "botright 7split " . output
    write
    execute "vsplit " . input
    write
    execute "normal! \<C-W>\<Up>"
endfunction

nnoremap <leader>oi :call OpenInputOutput('')<left><left>

" Execute latex
nnoremap <leader>tex :! pdflatex % && open %<."pdf"<CR>

" In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSearch('gv')<CR>
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Add executable mode to bash and python scripts
function! SetExecutableMode()
    if getline(1) =~ "^#!"
        if getline(1) =~ "/bin/"
            silent !chmod a+x <afile>
        endif
    endif
endfunction

autocmd BufWritePost * call SetExecutableMode()

" Turn on nice python highlight
" let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

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

" Some plugins
filetype plugin indent on

" Turn on pathogen plugin
call pathogen#infect()

if has("autocmd")
    " When vimrc is edited, reload it
    autocmd! BufWritePost .vimrc source ~/.vimrc
    " Show tabs in Makefiles
    autocmd! FileType make setlocal noexpandtab list
endif

" Something about encodings and russian language in vim
" set encoding=utf8
" set fileencodings=cp1251,utf8

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

" user filetype file
if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect

au! BufNewFile,BufRead *.applescript   setf applescript
au! BufNewFile,BufRead *.plt,*.gnuplot setf gnuplot

augroup END
