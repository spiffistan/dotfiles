" -- Options -----------------------------------------------------------------

let mapleader = ","

set nocompatible
set hidden
set backspace=indent,eol,start
set ruler
set rulerformat=%15(%c%V\ %p%%%)
set showcmd
set showmode
set directory=/Users/anders/.vim/tmp
set autoindent
set smartindent
set background=dark
set transparency=2
set backspace=indent,eol,start
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set cursorline
set guifont=Consolas:h11
"set guifont=Inconsolata:h12
set guioptions=egt
set guitablabel=%M%t
set shiftwidth=2
set tabstop=2
set termencoding=utf-8
set visualbell
set window=79
set wildmenu
" set wildmode=list:longest,full
set statusline=%F%m%r%h%w\ [%Y]\ [%{&ff}]\ (%04l,%04v)\ (%p%%/%LL)
set shortmess+=r
set isk+=_,$,@,%,#,-,?,%,& " none of these should be word dividers, so make them not be
set laststatus=2
set showmatch
set ttyfast
set cindent
set esckeys
set backspace=2
set cole=2
set listchars=extends:»,trail:°,tab:>¤,eol:¶
set lcs=tab:└─,trail:·,extends:>,precedes:<,nbsp:&
set fo=croqnvt
set sm
set so=4
set wrap
set list
set ignorecase
set smartcase
set incsearch

filetype on
filetype plugin on
filetype indent on


" -- Tabs --------------------------------------------------------------------

"set showtabline=2    " always show tab bar
set tabpagemax=20    " maximum number of tabs to create

" new tab
nnoremap <C-t>     :tabnew<cr>
vnoremap <C-t>     <C-C>:tabnew<cr>
inoremap <C-t>     <C-C>:tabnew<cr>
" tab left
nnoremap <C-h>     :tabprevious<cr>
vnoremap <C-h>     <C-C>:tabprevious<cr>
inoremap <C-h>     <C-O>:tabprevious<cr>
nnoremap <C-S-tab> :tabprevious<cr>
vnoremap <C-S-tab> <C-C>:tabprevious<cr>
inoremap <C-S-tab> <C-O>:tabprevious<cr>
" tab right
nnoremap <C-l>     :tabnext<cr>
vnoremap <C-l>     <C-C>:tabnext<cr>
inoremap <C-l>     <C-O>:tabnext<cr>
nnoremap <C-tab>   :tabnext<cr>
vnoremap <C-tab>   <C-C>:tabnext<cr>
inoremap <C-tab>   <C-O>:tabnext<cr>
" tab indexes
noremap <A-1> 1gt
noremap <A-2> 2gt
noremap <A-3> 3gt
noremap <A-4> 4gt
noremap <A-5> 5gt
noremap <A-6> 6gt
noremap <A-7> 7gt
noremap <A-8> 8gt
noremap <A-9> 9gt
noremap <A-0> 10gt

" <leader> <tab> -> last open tab

if version >= 700
  au TabLeave * let g:MRUtabPage = tabpagenr()
  fun MRUTab()
    if exists( "g:MRUtabPage" )
      exe "tabn " g:MRUtabPage
    endif
  endfun
  nmap <silent> <leader> <tab> :call MRUTab()<CR>
endif

" -- Utility -----------------------------------------------------------------

nnoremap ' `
nnoremap ` '

colorscheme solarized
let g:solarized_contrast="high"
syntax on

filetype on
filetype plugin indent on

fun ToggleBG()
  if(&background == 'dark')
    set background=light
  else
    set background=dark
  endif
endfun

cmap w!! %!sudo tee > /dev/null %

nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

nnoremap <silent> <leader>t :NERDTreeToggle<CR>
nnoremap <silent> <leader>n :call ToggleBG()<CR>
nnoremap <silent> <leader>s :set list! list?<CR>
nnoremap <silent> <leader>h :set hlsearch! hlsearch?<CR>

" -- Block comments ----------------------------------------------------------

" Perl, Python and shell scripts
autocmd BufNewFile,BufRead *.py,*.pl,*.sh,*rb,*.php vmap u :-1/^#/s///<CR>
autocmd BufNewFile,BufRead *.py,*.pl,*.sh,*rb,*.php vmap c :-1/^/s//#/<CR>
" C, C++
autocmd BufNewFile,BufRead *.h,*.c,*.cpp,*.m,*.mm vmap u :-1/^\/\//s///<CR>
autocmd BufNewFile,BufRead *.h,*.c,*.cpp,*.m,*.mm vmap s :-1/^/s//\/\//<CR>
