set cursorline
set nocompatible
filetype on
filetype off  " required!
set rtp+=~/.dotvim/bundle/vundle/ 
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
" "
" " original repos on github
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/markdown'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/pry-editline'
Bundle 'tpope/vim-liquid'
Bundle 'tpope/vim-eunuch'
Bundle 'tomtom/tcomment_vim'
Bundle 'aaronjensen/vim-sass-status'
Bundle 'vim-scripts/ZoomWin'
Bundle 'vim-scripts/Rainbow-Parenthesis'
Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
Bundle 'fholgado/Molokai2'
Bundle 'nelstrom/vim-mac-classic-theme'
Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'cldwalker/vimdb'
Bundle 'mileszs/ack.vim'
Bundle 'tsaleh/vim-matchit'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'Raimondi/delimitMate'
Bundle 'kchmck/vim-coffee-script'
Bundle 'groenewege/vim-less'
Bundle 'flazz/vim-colorschemes'
Bundle 'pangloss/vim-javascript'
Bundle 'Lokaltog/vim-powerline'
Bundle 'nono/vim-handlebars'
Bundle 'itspriddle/vim-jquery'
Bundle 'mutewinter/nginx.vim'
Bundle 'wincent/Command-T'
Bundle 'vim-ruby/vim-ruby'
Bundle 'ap/vim-css-color'
Bundle 'FuzzyFinder'
Bundle 'rails.vim'
Bundle 'L9'
Bundle 'SuperTab'
Bundle 'jQuery'
Bundle 'The-NERD-Commenter'
Bundle 'Sass'
Bundle 'Markdown'
Bundle 'taglist.vim'
Bundle 'surround.vim'
Bundle 'git://github.com/pangloss/vim-javascript.git'
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'

:runtime macros/matchit.vim

set smarttab
set autoread
set linebreak

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
set nobackup
set nowb
set noswapfile
set undodir=~/.dotvim/backups
set undofile

syntax on
set nohidden
set history=10000
set number
set numberwidth=5
set ruler
set switchbuf=useopen
set encoding=utf-8

" Softtabs, 2 spaces
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set list listchars=tab:\ \ ,trail:·

set hlsearch "Highlight search things
set incsearch "Make search act like search in modern browsers
set ignorecase      " Don't care about case...
set smartcase   " ... unless the query contains upper case characters
nnoremap <leader>i :set incsearch!<CR>
nnoremap <leader>h :set hlsearch!<CR>
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch
set magic "Set magic on, for regular expressions
set mat=2 "How many tenths of a second to blink

if has("wildmenu")
  set wildignore+=*.a,*.o,*.obj,*.exe,*.dll,*.manifest
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png,*.jpeg
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
  set wildmenu
  set wildmode=longest,list
endif

set laststatus=2

set t_Co=256
let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
let g:CSApprox_eterm = 1
set colorcolumn=+1
colorscheme Molokai2

set showcmd " Display an incomplete command in the lower right corner of the Vim window
set novisualbell  " No blinking
set noerrorbells  " No noise.
set vb t_vb= " disable any beeps or flashes on error

set modelines=10

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'
map <Leader>rt :!ctags --extra=+f -R *<CR><CR>
map <C-\> :tnext<CR>

" Remember Last location in file
augroup line_return
  au!
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END"`'>"'"

" make uses real tabs
au FileType * set expandtab
au FileType make set noexpandtab

au BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,config.ru}    set ft=ruby
au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.hamlbars set ft=haml
au BufNewFile,BufRead *.hamlc set ft=haml
au BufNewFile,BufRead *.jst.ejs set ft=jst

au FileType * set softtabstop=2 tabstop=2 shiftwidth=2

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

set scrolloff=2

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" Slow Vim
set notimeout
set ttimeout
set timeoutlen=50

set nopaste
set tw=80
set formatoptions=qrn1
set title
set foldmethod=indent
set foldlevel=99

" Numbers

filetype on
filetype plugin on
filetype indent on             " Automatically detect file types.

" Visual "{{{
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set shortmess=atI " Shortens messages
set autoindent    " Enable automatic indenting for files with ft set
set smartindent
set ttyfast
set showmode
set backspace=indent,eol,start
set virtualedit=all

set notimeout
set ttimeout
set timeoutlen=50
set notimeout
set ttimeout
set timeoutlen=50
set notimeout
set ttimeout
set timeoutlen=50
set notimeout
set ttimeout
set timeoutlen=50

" Search for the file in all paths 
:set path=.,~/src/**,/usr/include,,

let g:Powerline_symbols = 'fancy'
let g:Powerline_stl_path_style = 'short'
call Pl#Theme#RemoveSegment('fugitive:branch')
call Pl#Theme#RemoveSegment('fileformat')
call Pl#Theme#RemoveSegment('fileencoding')
call Pl#Theme#RemoveSegment('scrollpercent')

" Fast saving
nmap <leader>w :w!<cr>
cmap w!! w !sudo tee % >/dev/null

" " Fast editing of the .vimrc
map <leader>e :e! ~/.vim_runtime/vimrc<cr>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" " When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.dotvim/vimrc
autocmd! bufwritepost .vimrc source ~/.dotvim/vimrc


" Leader
let mapleader = ","

" Remap jj to esc in insert mode
inoremap jj <Esc>

" hitting d will duplicate whatever's selected directly below
vmap D y'>p


"""" Command Line
set wcm=<C-Z>               " Ctrl-Z in a mapping acts like <Tab> on cmdline
source $VIMRUNTIME/menu.vim " Load menus (this would be done anyway in gvim)
" <F4> triggers the menus, even in terminal vim.

" Wildmenu

" remap Ctrl+X Ctrl+F to Tab for file completion in insertmode
inoremap <Tab> <C-X><C-F>

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Yank from the cursor to the end of the line, to be consistent with C and D.
noremap Y y$


" Splits  ,v to open a new vertical split and switch to it
nnoremap <leader>v <C-w>v<C-w>l

" Open the Rails ApiDock page for the word under cursor
function! OpenRailsDoc(keyword)
  let url = 'http://apidock.com/rails/'.a:keyword
  call OpenInBrowser(url)
endfunction
noremap RR :call OpenRailsDoc(expand('<cword>'))<CR>'

function! MakeSpacelessIabbrev(from, to)
  execute "iabbrev <silent> ".a:from." ".a:to."<C-R>=EatChar('\\s')<CR>"
endfunction
 
" Enable syntastic syntax checking
let g:syntastic_enable_signs=1
let g:syntastic_quiet_warnings=1

" Use Node.js for JavaScript interpretation
let $JS_CMD='node'

iabbrev vrcf `~/.vimrc` file


" Resize splits when the window is resized
au VimResized * :wincmd =

" Fuzzy Finder {
" Fuzzy Find file, tree, buffer, line
nmap <leader>ff :FufFile **/<CR>
nmap <leader>fb :FufBuffer<CR>
nmap <leader>fl :FufLine<CR>
nmap <leader>fr :FufRenewCache<CR>
" }

" TREAT <LI> AND <P> TAGS LIKE THE BLOCK TAGS THEY ARE
let g:html_indent_tags = 'li\|p'

" Highlight current line
set cursorline

" tabs
map tt :tabnew<CR>
map td :tabclose<CR>
map tn :tabnext<CR>
map tp :tabprev<CR>

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1
let NERDChristmasTree = 1
let NERDTreeWinPos = "right"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50

" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :1,300 bd!<cr>
" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>

" Maps autocomplete to tab
imap <Tab> <C-P>

" Keep search matches in the middle of the window and pulse the line when moving
" to them.
nnoremap n nzzzv
nnoremap N Nzzzv

" Switch buffers with L and H easily
map <C-L> :bn<cr>
map <C-H> :bp<cr>
map H ^
map L g_

autocmd FileType css,less set smartindent
autocmd FileType html set formatoptions+=tl
autocmd FileType html,css set noexpandtab tabstop=2

set lbr

" set autoindent "Auto indent
set formatoptions=qrn1

" CSS and LessCSS {{{
augroup ft_css
  au!
  au BufNewFile,BufRead *.less setlocal filetype=less
  au Filetype less,css setlocal foldmethod=marker
  au Filetype less,css setlocal foldmarker={,}
  au Filetype less,css setlocal omnifunc=csscomplete#CompleteCSS
  au Filetype less,css setlocal iskeyword+=-
  au BufNewFile,BufRead *.less,*.css nnoremap <buffer> <localleader>S ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR>
  au BufNewFile,BufRead *.less,*.css inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" Javascript {{{
augroup ft_javascript
  au!

  au FileType javascript setlocal foldmethod=marker
  au FileType javascript setlocal foldmarker={,}

  " Make {<cr> insert a pair of brackets in such a way that the cursor is correctly
  " positioned inside of them AND the following code doesn't get unfolded.
  au Filetype javascript inoremap <buffer> {<cr> {}<left><cr><space><space><space><space>.<cr><esc>kA<bs>
augroup END

" Ruby {{{
augroup ft_ruby
  au!
  au Filetype ruby setlocal foldmethod=syntax
augroup END

" automatic persitent undo across sessions on any file
if has("persistent_undo")
  set undodir=~/.dotvim/undodir
  set undofile
endif

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Parenthesis/bracket expanding
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i

"  ---------------------------------------------------------------------------
"  "  SASS / SCSS
"  "  ---------------------------------------------------------------------------
au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss



"DISABLE ARROW KEYS
function! DelEmptyLineAbove()
  if line(".") == 1
    return
  endif
  let l:line = getline(line(".") - 1)
  if l:line =~ '^\s*$'
    let l:colsave = col(".")
    .-1d
    silent normal! <C-y>
    call cursor(line("."), l:colsave)
  endif
endfunction

function! AddEmptyLineAbove()
  let l:scrolloffsave = &scrolloff
  " Avoid jerky scrolling with ^E at top of window
  set scrolloff=0
  call append(line(".") - 1, "")
  if winline() != winheight(0)
    silent normal! <C-e>
  endif
  let &scrolloff = l:scrolloffsave
endfunction

function! DelEmptyLineBelow()
  if line(".") == line("$")
    return
  endif
  let l:line = getline(line(".") + 1)
  if l:line =~ '^\s*$'
    let l:colsave = col(".")
    .+1d
    ''
    call cursor(line("."), l:colsave)
  endif
endfunction

function! AddEmptyLineBelow()
  call append(line("."), "")
endfunction

" Arrow key remapping: Up/Dn = move line up/dn; Left/Right = indent/unindent
function! SetArrowKeysAsTextShifters()
  " normal mode
  nmap <silent> <Left> <<
  nmap <silent> <Right> >>
  nnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>
  nnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>
  nnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>
  nnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>

  " visual mode
  vmap <silent> <Left> <
  vmap <silent> <Right> >
  vnoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>gv
  vnoremap <silent> <Down>  <Esc>:call AddEmptyLineAbove()<CR>gv
  vnoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>gv
  vnoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>gv

  " insert mode
  imap <silent> <Left> <C-D>
  imap <silent> <Right> <C-T>
  inoremap <silent> <Up> <Esc>:call DelEmptyLineAbove()<CR>a
  inoremap <silent> <Down> <Esc>:call AddEmptyLineAbove()<CR>a
  inoremap <silent> <C-Up> <Esc>:call DelEmptyLineBelow()<CR>a
  inoremap <silent> <C-Down> <Esc>:call AddEmptyLineBelow()<CR>a

  " disable modified versions we are not using
  nnoremap  <S-Up>     <NOP>
  nnoremap  <S-Down>   <NOP>
  nnoremap  <S-Left>   <NOP>
  nnoremap  <S-Right>  <NOP>
  vnoremap  <S-Up>     <NOP>
  vnoremap  <S-Down>   <NOP>
  vnoremap  <S-Left>   <NOP>
  vnoremap  <S-Right>  <NOP>
  inoremap  <S-Up>     <NOP>
  inoremap  <S-Down>   <NOP>
  inoremap  <S-Left>   <NOP>
  inoremap  <S-Right>  <NOP>
endfunction

call SetArrowKeysAsTextShifters()


" set clipboard to unnamed clipboard
set clipboard=unnamed

" Pretty colors for fuzzyfinder menus
highlight Pmenu ctermfg=black ctermbg=gray
highlight PmenuSel ctermfg=black ctermbg=white
