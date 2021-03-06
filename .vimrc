" Change ~/dotfiles/vimbundles if you cloned to a different path
call pathogen#infect('~/dotfiles/vimbundles')
syntax on
filetype plugin indent on

set nocompatible
set history=100
" prevent generation of .swp and other gubbins
set nobackup
set nowritebackup
set noswapfile
" set the search scan to wrap lines
set wrapscan
" set the search scan so that it ignores case when the search is all lower
" case but recognizes uppercase if it's specified
set ignorecase
set smartcase
" use a forward-slash in paths under win
set shellslash
" make command line two lines high
set ch=2
" disable audible bell
set vb
" allow backspacing over indent, eol, and the start of an insert
set backspace=2
" make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden
" drop a marker at the end of a change area (ie using 'cw') instead of
" deleting it
set cpoptions=Bces$
" tell VIM to always put a status line in, even if there is only one window
set laststatus=2
" don't update the display while executing macros
set lazyredraw
" show the current command in the lower right corner
set showcmd
" show the current mode
set showmode
" these commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
" save and restore folds in the file itself
set foldmethod=marker
" when the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8
" allow the cursor to go in to "invalid" places
set virtualedit=all
" these things start comment lines
set comments=sl:/*,mb:\ *,ex:\ */,O://,b:#,:%,:XCOMM,n:>,fb:-
" disable encryption (:X)
set key=
" make the command-line completion better
set wildmenu
" same as default except that I remove the 'u' option
set complete=.,w,b,t
" when completing by tag, show the whole tag, not just the function name
set showfulltag
" set the textwidth to 80 chars
set textwidth=80
" get rid of the characters in window separators
set fillchars=""
" turn tabs into spaces
set expandtab
" tabstops are 4 spaces
set tabstop=4
set shiftwidth=4
set shiftround
" add ignorance of whitespace to diff
set diffopt+=iwhite
" enable search highlighting
set hlsearch
" incrementally match the search
set incsearch
" Turn off that stupid highlight search
nmap <silent> \n :set invhls<CR>:set hls?<CR>
set number
set tags=./tags;

" GUI Configuration

" hide the mouse pointer while typing
set mousehide
" set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
" set the gui options the way I like
set guioptions=ac

colorscheme vividchalk
if has("gui_running")
    highlight Pmenu guibg=brown gui=bold
    set guifont=Monaco\ 9,Monaco:h10,Consolas:h12
endif

" Syntax highlighting customisation
highlight Comment gui=NONE

" syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" Input configuration
" timeout for multi-key combos
"
" i.e. for the ",d" command, there is a "timeoutlen" wait period between the
"      "," key and the "d" key.  If the "d" key isn't pressed before the
"      timeout expires, one of two things happens: The "," command is executed
"      if there is one (which there isn't) or the command aborts.
set timeoutlen=500

" utility macros/bindings
nnoremap <silent><F2> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><F3> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
nnoremap <silent><F4> :set paste<CR>m`o<Esc>``:set nopaste<CR>
nnoremap <silent><F5> :set paste<CR>m`O<Esc>``:set nopaste<CR>
" cd to the directory containing the file in the buffer
nmap <silent> ,cd :lcd %:h<CR>
nmap <silent> ,md :!mkdir -p %:p:h<CR>
" set text wrapping toggles
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>
" run the command that was just yanked
nmap <silent> ,rc :@"<cr>
" maps to make handling windows a bit easier
noremap <silent> ,h :wincmd h<CR>
noremap <silent> ,j :wincmd j<CR>
noremap <silent> ,k :wincmd k<CR>
noremap <silent> ,l :wincmd l<CR>
noremap <silent> ,sb :wincmd p<CR>
noremap <silent> <C-F9>  :vertical resize -10<CR>
noremap <silent> <C-F10> :resize +10<CR>
noremap <silent> <C-F11> :resize -10<CR>
noremap <silent> <C-F12> :vertical resize +10<CR>
noremap <silent> ,s8 :vertical resize 83<CR>
noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :close<CR>
noremap <silent> ,cw :cclose<CR>
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J
" delete buffer
noremap <silent> ,bd :bd<CR>
" delete all buffers
nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>
"Show/hide current line highlight
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

inoremap <C-]> <End>
"-----------------------------------------------------------------------------
" NERD Tree Plugin Settings
"-----------------------------------------------------------------------------
" Toggle the NERD Tree on an off with shift-F12
nmap <S-F12> :NERDTreeToggle<CR>
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"

" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1

" Improve autocomplete menu
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

" disable exmode
:map Q <Nop>

" Settings for VimClojure
let vimclojure#HighlightBuiltins=1      " Highlight Clojure's builtins
let vimclojure#ParenRainbow=1           " Rainbow parentheses'!

" Enable and customise powerline
set rtp+=~/dotfiles/powerline/powerline/bindings/vim
set noshowmode

" ctrlp config
nmap ; :CtrlPBuffer<CR>
"let g:ctrlp_match_window_bottom = 0
"let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

"syntastic config
let g:syntastic_auto_loc_list = 1
let g:syntastic_less_use_less_lint = 1
let g:syntastic_html_checkers = []

" unwanted whitespace highlighting
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

"zencoding config
let g:user_zen_leader_key='<C-e>'

"delimitMate config
let g:delimitMate_expand_cr = 1
let g:delitMate_balance_matchpairs = 1
