call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
filetype off  " required!

set rtp+=~/.vim/bundle/vundle/ 
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
" "
" " original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'vim-scripts/taglist' 
Bundle 'kchmck/vim-coffee-script'
Bundle 'fholgado/Molokai2'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tsaleh/vim-matchit'
Bundle 'groenewege/vim-less'
Bundle 'mileszs/ack.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'vim-scripts/ZoomWin'
Bundle 'nelstrom/vim-textobj-rubyblock'
" " vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" Bundle 'rails.vim'
" " non github repos
" Bundle 'git://git.wincent.com/command-t.git'

" Fast saving
nmap <leader>w :w!<cr>
cmap w!! w !sudo tee % >/dev/null

" " Fast editing of the .vimrc
map <leader>e :e! ~/.vim_runtime/vimrc<cr>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" " When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc
autocmd! bufwritepost .vimrc source ~/.vim/vimrc

" Easy buffer navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l
noremap <leader>v <C-w>v

" Leader
let mapleader = ","

" Remap jj to esc in insert mode
inoremap jj <Esc>

" hitting d will duplicate whatever's selected directly below
vmap D y'>p

colorscheme Molokai2 
set background=light " or dark
set t_Co=256

"""" Command Line
set history=1000            " Keep a very long command-line history.
set wcm=<C-Z>               " Ctrl-Z in a mapping acts like <Tab> on cmdline
source $VIMRUNTIME/menu.vim " Load menus (this would be done anyway in gvim)
" <F4> triggers the menus, even in terminal vim.

" Wildmenu
if has("wildmenu")
  set wildignore+=*.a,*.o
  set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
  set wildignore+=.DS_Store,.git,.hg,.svn
  set wildignore+=*~,*.swp,*.tmp
  set wildmenu
  set wildmode=longest,list
endif

" remap Ctrl+X Ctrl+F to Tab for file completion in insertmode
inoremap <Tab> <C-X><C-F>

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set expandtab
set wrap
set textwidth=80
set formatoptions=qrn1

set foldmethod=indent
set foldlevel=99

" Always display the status line
set laststatus=2

" Numbers
set number
set numberwidth=5

syntax on               " enable syntax
filetype on
filetype plugin on
filetype indent on             " Automatically detect file types.
" "}}}

" Visual "{{{
set showmatch  " Show matching brackets.
set matchtime=5  " Bracket blinking.
set novisualbell  " No blinking
set noerrorbells  " No noise.
set laststatus=2  " Always show status line.
set vb t_vb= " disable any beeps or flashes on error
set ruler  " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages

set ignorecase      " Don't care about case...
set smartcase   " ... unless the query contains upper case characters
set autoindent    " Enable automatic indenting for files with ft set
set nosmartindent
set nocindent

set showcmd   " Show command in statusline as it's being typed
set showmatch   " Jump to matching bracket
set ruler   " Show row,col %progress through file
set laststatus=0  " Dont't show statusline (2 is always)
set hidden        " Move between buffers without writing them.  Don't :q! or :qa! frivolously!"

"  Files, backups and undo
" " Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile


" TREAT <LI> AND <P> TAGS LIKE THE BLOCK TAGS THEY ARE
let g:html_indent_tags = 'li\|p'

" Set fancy stuff for statusline
let g:Powerline_symbols = 'fancy'

" Highlight current line
" :set cursorline

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
map L $

set ignorecase "Ignore case when searching

nnoremap <leader>i :set incsearch!<CR>
nnoremap <leader>h :set hlsearch!<CR>
autocmd InsertEnter * :setlocal nohlsearch
autocmd InsertLeave * :setlocal hlsearch

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

if exists(":Tabularize")
 nmap <Leader>a= :Tabularize /=<CR>
 vmap <Leader>a= :Tabularize /=<CR>
 nmap <Leader>a: :Tabularize /:\zs<CR>
 vmap <Leader>a: :Tabularize /:\zs<CR>
endif

inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" for CSS, also have things in braces indented:
autocmd FileType css,less set smartindent
" " for HTML, generally format text, but if a long line has been created
" " leave it alone when editing:
autocmd FileType html set formatoptions+=tl
" " for both CSS and HTML, use genuine tab characters for 
" " indentation, to make files a few bytes smaller:
autocmd FileType html,css set noexpandtab tabstop=2

set lbr
" set autoindent "Auto indent
set wrap linebreak nolist
set formatoptions=qrn1

" When pressing <leader>cd switch to the directory of the open buffer
 map <leader>cd :cd %:p:h<cr>

" " Custom maps to set working directories quickly
" " At Work
 map <leader>p1 :cd /Applications/XAMPP/htdocs/<cr>

command! Bclose call <SID>BufcloseCloseIt()
 function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
       let l:alternateBufNum = bufnr("#")

if buflisted(l:alternateBufNum)
 buffer #
else
 bnext
endif

if bufnr("%") == l:currentBufNum
  new
endif
if buflisted(l:currentBufNum)
  execute("bdelete!".l:currentBufNum)
endif
endfunction

 
function! s:align()
    let p = '^\s*|\s.*\s|\s*$'
      if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
            let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
                let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
                    Tabularize/|/l1
                        normal! 0
                            call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
                              endif
                            endfunction



" Toggle Nerdtree
nnoremap X :NERDTreeToggle<CR>

" automatic persitent undo across sessions on any file
if has("persistent_undo")
  set undodir=~/.vim/undodir
  set undofile
endif

nnoremap <F5> :GundoToggle<CR>

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

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>

" Format the statusline
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%ch

function! CurDir()
let curdir = substitute(getcwd(), '/Users/amir/', "~/", "g")
  return curdir
endfunction

function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  else
    return ''
  endif
endfunction

"  ---------------------------------------------------------------------------
"  "  SASS / SCSS
"  "  ---------------------------------------------------------------------------
au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END"`'>"'"

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
