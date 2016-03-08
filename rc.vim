" =====================================
" .vimrc wolfmetr <vladimys@gmail.com>
" =====================================

scriptencoding utf-8

" Setup {{{
" ======

    if has('vim_starting')

        set nocompatible                           " enable vim features

        set backupdir=$HOME/.cache/vim/backup      " where to put backup files
        set backup                                 " make backup file and leave it around 
        set backupskip+=svn-commit.tmp,svn-commit.[0-9]*.tmp

        set directory=/tmp                         " where to put swap files
        let g:SESSION_DIR   = $HOME . '/.cache/vim/sessions'

        " Create directories
        if finddir(&backupdir) == ''
            silent call mkdir(&backupdir, "p")
        endif

        if finddir(g:SESSION_DIR) == ''
            silent call mkdir(g:SESSION_DIR, "p")
        endif

        " Setup VimPlug {{{
        " =================

        call plug#begin($VIM_DIR . '/bundle')

        filetype plugin indent on
        syntax on

    endif

" }}}


" Options {{{
" =======
    " Buffer (File) options
    set hidden                  " Edit multiple unsaved files at the same time
    set confirm                 " Prompt to save unsaved changes when exiting
    set autoread                " auto reload changed files
    set autowrite               " automatically save before commands like :next and :make
    set noswapfile

    " Display options
    set title                   " show file name in window title
    set visualbell              " mute error bell
    set listchars=tab:⇥\ ,trail:·,extends:⋯,precedes:⋯,eol:$,nbsp:~
    set fillchars=fold:·
    set linebreak               " break lines by words
    set winminheight=0          " minimal window height
    set winminwidth=0           " minimal window width
    set scrolloff=4             " min 4 symbols bellow cursor
    set sidescroll=4
    set sidescrolloff=10
    set showcmd                 " Show commands
    set laststatus=2            " Always show a statusline
    set synmaxcol=1000          " Don't try to highlight lines longer than 1000 characters.
    set number
    set cursorline

    " Formatting
    set autoindent              " copy indent from previous line
    set expandtab               " tab with spaces
    set tabstop=4
    set smarttab                " indent using shiftwidth"
    set shiftwidth=4            " number of spaces to use for each step of indent
    set softtabstop=4           " tab like 4 spaces
    set shiftround              " drop unused spaces
    vnoremap < <gv
    vnoremap > >gv

    " Search options
    set hlsearch                " Highlight search results
    set ignorecase              " Ignore case in search patterns
    set smartcase               " Override the 'ignorecase' option if the search pattern contains upper case characters
    set incsearch               " While typing a search command, show where the pattern
    set wrapscan
    nmap <Space> :set invhls<cr>:set hls?<cr>

    " Insert
    set backspace=indent,eol,start " Allow backspace to remove indents, newlines and old tex"
    set nostartofline           " Emulate typical editor navigation behaviour
    set nopaste                 " Start in normal (non-paste) mode

    " Matching characters
    set showmatch               " Show matching brackets
    set matchpairs+=<:>         " Make < and > match as well


    set history=400             " history length

    " Localization
    set langmenu=none            " Always use english menu
    set keymap=russian-jcukenwin " Alternative keymap
    set iminsert=0               " English by default
    set imsearch=-1              " Search keymap from insert mode
    set spelllang=en,ru          " Languages
    set encoding=utf-8           " Default encoding
    set fileencodings=utf-8,cp1251,koi8-r,cp866
    set termencoding=utf-8

    " Tab completion in command line mode
    set wildmenu                   " Better commandline completion
    set wildmode=longest:full,full " Expand match on first Tab complete
    set wildcharm=<TAB>
    set wildignore+=.hg,.git,.svn                    " Version control
    set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
    set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
    set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
    set wildignore+=*.spl                            " compiled spelling word lists
    set wildignore+=*.sw?                            " Vim swap files
    set wildignore+=*.DS_Store                       " OSX bullshit
    set wildignore+=*.zip


    " Undo
    if has('persistent_undo')
        set undofile            " enable persistent undo
        set undodir=/tmp/       " store undofiles in a tmp dir
    endif

    " Term
    set mouse=a                     " Disable mouse usage (all modes) in terminals
    " Quickly time out on keycodes, but never time out on mappings
    set notimeout ttimeout ttimeoutlen=200
    if &term =~ 'xterm'
        set t_Co=256            " set 256 colors
    endif

    let g:changelog_username = $USER
    let mapleader = ','
    let maplocalleader = ' '

    " Color themes
    Plug 'altercation/vim-colors-solarized'
    Plug 'tomasr/molokai'
    Plug 'vim-scripts/darktango.vim'
    Plug 'jnurmine/Zenburn'
    Plug 'sjl/badwolf'
    Plug 'jonathanfilip/vim-lucius'
    let g:rehash256 = 1
    set rtp+=$VIM_DIR/bundle/vim-colors-solarized
    set rtp+=$VIM_DIR/bundle/molokai
    set rtp+=$VIM_DIR/bundle/darktango.vim
    set rtp+=$VIM_DIR/bundle/Zenburn 
    set rtp+=$VIM_DIR/bundle/badwolf
    set rtp+=$VIM_DIR/bundle/vim-lucius
    if !exists('g:colors_name')
        colorscheme lucius

        let g:badwolf_darkgutter = 1
    endif
" }}}

" NERDTree {{{
" =========
Plug 'scrooloose/nerdtree', { 'tag': '5.0.0' }
let NERDTreeWinSize = 30
nnoremap <silent> <Leader>t :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
" }}}

Plug 'kien/ctrlp.vim', { 'tag': '1.79' }

Plug 'jlanzarotta/bufexplorer', { 'tag': 'v7.4.6' }
let g:bufExplorerShowRelativePath=1
let g:bufExplorerSortBy='fullpath'
nmap <silent> <Leader>e :BufExplorer<CR>

Plug 'mileszs/ack.vim', { 'tag': '1.0.9' }
Plug 'powerline/powerline', { 'tag': '2.2' }
Plug 'tpope/vim-fugitive', { 'tag': 'v2.2' }

" Airline
Plug 'vim-airline/vim-airline', { 'tag': 'v0.7' }
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'bubblegum'
"let g:airline_left_sep = 'U+2B83'
"let g:airline_right_sep = 'U+2B81'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"let g:airline_symbols.space = "\ua0"

" Tagbar
Plug 'majutsushi/tagbar', { 'tag': 'v2.6.1' }

let g:tagbar_width = 40
let g:tagbar_foldlevel = 1
let g:tagbar_type_rst = {
    \ 'ctagstype': 'rst',
    \ 'kinds': [ 'r:references', 'h:headers' ],
    \ 'sort': 0,
    \ 'sro': '..',
    \ 'kind2scope': { 'h': 'header' },
    \ 'scope2kind': { 'header': 'h' }
\ }

" Toggle tagbar
nnoremap <silent> <F3> :TagbarToggle<CR>

" Complete
Plug 'Shougo/neocomplete', { 'tag': 'ver.2.0' }
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
set completeopt-=preview
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif


" Commands {{{
" ============
    " Typos
    command! -bang E e<bang>
    command! -bang Q q<bang>
    command! -bang W w<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Wq wq<bang>
    command! -bang WQ wq<bang>

" }}}

for f in split(glob($VIM_DIR . '/vimrc.d/*.vim'), '\n')
    execute 'source' f
endfor

" Local settings
" ================
if filereadable($HOME . '/.vim_local')
    source $HOME/.vim_local
endif



" Finish
" ================

call plug#end()

" enables the reading of .vimrc, .exrc and .gvimrc in the current directory.
set exrc
" must be written at the last.  see :help 'secure'.
set secure

