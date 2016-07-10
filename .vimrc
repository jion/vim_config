set nocompatible " be iMproved, required
filetype off " required

" Plugins (using junegunn/vim-plug)
call plug#begin('~/.vim/bundle')

Plug 'airblade/vim-gitgutter'
Plug 'wting/gitsessions.vim'
Plug 'scrooloose/nerdtree'
Plug 'yegappan/mru'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'

Plug 'fatih/vim-go'
Plug 'cfsalguero/perl-go-to-def'
Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'ternjs/tern_for_vim'
Plug 'helino/vim-json'

call plug#end()
"""""""""""""""""""""""""""""""""""

filetype plugin indent on " required
syntax on

" Send more characters for redraws
set ttyfast
"
" Enable mouse use in all modes
"set mouse=
"
" Set this to the name of your terminal that supports mouse codes.
" Must be one of: xterm, xterm2, netterm, dec, jsbterm, pterm
"set ttymouse=xterm2

set completeopt=longest,menuone
set showtabline=2
set path=.,,**

:let mapleader = ","

let g:neomake_verbose=1
let g:neomake_logfile='/tmp/s'

let g:ycm_auto_trigger=1
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_min_num_of_chars_for_completion=3
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 0 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:Show_diagnostics_ui = 1 "default 1

let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': [],'passive_filetypes': [] }
let g:syntastic_auto_loc_list = 0
let g:syntastic_go_checkers = ['gofmt', 'go', 'golint', 'govet', 'errcheck']
let g:syntastic_enable_perl_checker = 1
let g:syntastic_perl_checkers = ['perl', 'podchecker']

let g:go_fmt_fail_silently = 1
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 0
let g:go_highlight_structs = 0
let g:go_fmt_command = "goimports"
"let g:go_list_type = "quickfix"

"air-line
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_buffers = 0

let NERDTreeQuitOnOpen = 1
"
let g:session_autoload = 'yes'
let g:session_autosave = 'yes'
let g:session_default_to_last = 1

au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>i <Plug>(go-info)

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.go set filetype=go
"autocmd! BufWritePost * Neomake


:let g:session_autosave = 'yes'
" To speed up GitSessions
set ssop-=options    " do not store global and local values in a session
"set ssop-=folds      " do not store folds


set number
set t_Co=256
set background=dark
set expandtab
set tabstop=2 
set shiftwidth=2
set virtualedit=all                       
set backspace=2
set nocompatible
set nowrap
set cursorline
set syntax=sh
set showmatch
set autoindent
set expandtab
set history=150
set formatoptions=tcql
set nostartofline
set laststatus=2
set hlsearch
set foldmethod=syntax
set foldlevelstart=20
set hidden

colorscheme hybrid

hi CursorLine term=none cterm=none ctermbg=Black
hi TabLineFill ctermfg=White ctermbg=DarkGrey
hi TabLine term=none cterm=none ctermfg=White ctermbg=DarkGrey
hi TabLineSel term=none cterm=none ctermfg=White ctermbg=Blue
" Overriden by airline
"set statusline=%F%m%r%h%w\ \ \ [FORMAT=%{&ff}]\ [TYPE=%Y]\ \ \ \ \ \ \ \ [POS=%4l,%4v]\ \ \ \ \ \ [%p%%]\ [LEN=%L] 
"
" Mappings for Solaris
"set <F3>=OR
"set <F4>=[[D
"set <F5>=[[E
"set <F6>=[17~
"set <F7>=[18~
"set <F8>=[19~
"set <F9>=[20~
"set <F10>=[21~
"set <s-F2>=[24~
"set <s-F4>=O1;2S
"set <Del>=[3~
"set <C-u>=
"set <PageUp>=[5~
"set <PageDown>=[6~
"set <Home>=[1~
"set <End>=[4~
"set <Insert>=[2~

map  <C-n>       :NERDTreeToggle<CR>
map  <C-k>       <Esc>:bnext<CR>
map  <C-j>       <Esc>:bprevious<CR>
map  <C-x>       <Esc>:bd<CR>
map  <C-h>       <Esc>:noh<Up>
map  <C-Right>   <Esc><C-w><Right><CR>
map  <C-Left>    <Esc><C-w><Left><CR>
map  <C-Down>    <Esc><C-w><Down>
map  <C-Up>      <Esc><C-w><Up>

" :w!! will write read only files not opened with sudo
cmap w!! w !sudo tee % >/dev/null

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

