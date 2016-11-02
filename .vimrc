""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen will take care of most plugins
execute pathogen#infect()
let g:syntastic_always_populate_loc_list=1

" don't enable syntastic by default
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes': ['ocaml','llvm'],
    \ 'passive_filetypes': []
    \ }

" merlin
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_ocaml_checkers=['merlin']

" rootignore (respect gitignore files)
let g:RootIgnoreAgignore = 0 " don't use ag (silversearcher) for indexing

" ctrl-p
let g:ctrlp_working_path_mode = 'war' " search from root directory with git (wr)
let g:ctrlp_by_filename = 1 " search by filename (as opposed to full path)

" airline
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" general vim config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syn on " main reason to use vim
filetype plugin on " load filetype specific plugins

set backspace=2 " normal backspace behavior
set mouse=v " (unlike mouse=a in .gvimrc) to shared X11 mouse clipboard

set nowrap "disable line wrapping by default
set textwidth=80
set formatoptions-=tc " disable splitting/breaking of lines

" indenting
set ai " automatically indent files
set et " expand tabs to spaces
set ts=4 " tabs are only 4 spaces wide
set sw=4 " tabs are only 4 spaces wide

" exceptional indenting rules for filetypes
"autocmd FileType make setlocal noexpandtab
"autocmd FileType ml setlocal ts=2
"autocmd FileType ml setlocal sw=2

" configure filename completion
if has("wildmenu")
    set wildignore+=*.a,*.o,*.obj " ignore c-style object and lib files
    set wildignore+=*.cmi,*.cmo,*.cmx " ignore ocaml object files
    set wildignore+=*.cmt,*.cmti " ignore ocaml type desc files
    set wildignore+=*.pyc " ignore python compiled files
    set wildmode=longest,list " bash-like filename completion
endif

" enable project specific vim config files
set exrc
set secure

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" visual configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" highlight superfluous whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
match ExtraWhitespace /\s\+$/ " trailing whitespace
"autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
"autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"autocmd InsertLeave * match ExtraWhitespace /\s\+$/
"autocmd BufWinLeave * call clearmatches()


set hls " highlight searches
"set number "show line numbers on left marging for every line
set ruler "show ruler below text with cursor postion etc
set cursorline " draw ruler on current cursor's line
set colorcolumn=+1 "draw a line at 81th char column
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l\:%c%V%)
set laststatus=2 " always display statusline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color scheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"colorscheme delek

set fillchars+=vert:│ " gapless split screen separator

" based on delek
let colors_name = "delek_blue"

" Normal should come first
hi Normal     guifg=Black  guibg=White
hi Cursor     guifg=bg     guibg=fg
hi lCursor    guifg=NONE   guibg=Cyan

" Note: we never set 'term' because the defaults for B&W terminals are OK
hi DiffAdd    ctermbg=LightBlue    guibg=LightBlue
hi DiffChange ctermbg=LightMagenta guibg=LightMagenta
hi DiffDelete ctermfg=Blue	   ctermbg=LightCyan gui=bold guifg=Blue guibg=LightCyan
hi DiffText   ctermbg=Red	   cterm=bold gui=bold guibg=Red
hi Directory  ctermfg=DarkBlue	   guifg=Blue
hi ErrorMsg   ctermfg=White	   ctermbg=DarkRed  guibg=Red	    guifg=White
hi FoldColumn ctermfg=DarkBlue	   ctermbg=Grey     guibg=Grey	    guifg=DarkBlue
hi Folded     ctermbg=Grey	   ctermfg=DarkBlue guibg=LightGrey guifg=DarkBlue
hi IncSearch  cterm=reverse	   gui=reverse
hi LineNr     ctermfg=Brown	   guifg=Brown
hi ModeMsg    cterm=bold	   gui=bold
hi MoreMsg    ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi NonText    ctermfg=Blue	   gui=bold guifg=gray guibg=white
hi Pmenu      guibg=LightBlue
hi PmenuSel   ctermfg=White	   ctermbg=DarkBlue  guifg=White  guibg=DarkBlue
hi Question   ctermfg=DarkGreen    gui=bold guifg=SeaGreen
hi Search     ctermfg=grey ctermbg=blue guibg=Yellow guifg=NONE
hi SpecialKey ctermfg=DarkBlue	   guifg=Blue
hi StatusLine cterm=bold	   ctermbg=blue ctermfg=yellow guibg=gold guifg=blue
hi StatusLineNC	cterm=bold	   ctermbg=blue ctermfg=black  guibg=gold guifg=blue
hi Title      ctermfg=DarkMagenta  gui=bold guifg=Magenta
hi VertSplit  cterm=None	   gui=None
hi Visual     ctermbg=NONE	   cterm=reverse gui=reverse guifg=Grey guibg=fg
hi VisualNOS  cterm=underline,bold gui=underline,bold
hi WarningMsg ctermfg=DarkRed	   guifg=Red
hi WildMenu   ctermfg=grey ctermbg=blue guibg=Yellow guifg=Black

" syntax highlighting
hi Comment    cterm=NONE ctermfg=DarkRed     gui=NONE guifg=red2
hi Constant   cterm=NONE ctermfg=DarkGreen   gui=NONE guifg=green3
hi Identifier cterm=NONE ctermfg=DarkCyan    gui=NONE guifg=cyan4
hi PreProc    cterm=NONE ctermfg=DarkMagenta gui=NONE guifg=magenta3
hi Special    cterm=NONE ctermfg=LightRed    gui=NONE guifg=deeppink
hi Statement  cterm=bold ctermfg=Blue	     gui=bold guifg=blue
hi Type	      cterm=NONE ctermfg=Blue	     gui=bold guifg=blue
