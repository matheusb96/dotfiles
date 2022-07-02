set nocompatible              " be iMproved, required
filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=/usr/local/opt/fzf
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Bundles
Plugin 'ervandew/supertab'
Plugin 'Lokaltog/vim-powerline'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'Keithbsmiley/rspec.vim'
Plugin 'tpope/vim-endwise'
Plugin 'geoffharcourt/vim-matchit'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'
Plugin 'danro/rename.vim'
Plugin 'thoughtbot/vim-rspec'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-scripts/bufkill.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'pangloss/vim-javascript'
Plugin 'terryma/vim-multiple-cursors' 
Plugin 'gorkunov/smartpairs.vim'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'
Plugin 'carlosgaldino/elixir-snippets'
Plugin 'mileszs/ack.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'joshdick/onedark.vim'
Plugin 'tpope/vim-commentary'
Plugin 'othree/yajs.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'vimwiki/vimwiki'
Plugin 'sheerun/vim-polyglot'

call vundle#end()  

filetype plugin indent on
syntax on

set history=100
set nobackup
set noswapfile
set pastetoggle=<F6>
set mouse=a
set encoding=utf-8

set title
set titleold=
set ruler
set number

set backspace=2        " indent,eol,start
set whichwrap+=<,>,h,l
set shortmess=aTsI     " see :help shortmess
set noerrorbells
set visualbell
set scrolloff=3
set sidescroll=3

set autoread
set splitright
set splitbelow
set hidden
set clipboard=unnamed

set timeoutlen=500
set showmatch
set matchtime=1
set hlsearch
set incsearch
set ignorecase
" set list
" set listchars=eol:$,trail:·,tab:>·
set laststatus=2
set fileformat=unix

set autoindent
set smartindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set nowrap
" set textwidth=80
set linebreak

set foldenable
set foldmethod=expr
set foldexpr=getline(v:lnum)=~'^\\s\\+#'  " fold comments
set foldminlines=4
set foldopen-=undo      " don't open folds when you undo stuff

set virtualedit=block
set backspace=indent,eol,start

autocmd BufRead *irb-interactive* setl ft=ruby
autocmd BufRead nginx.conf setl ft=nginx
autocmd BufRead *.jst.ejs setl ft=jst

" Reek
"let g:reek_always_show = 0

" Syntastic
" let g:syntastic_ruby_checkers = ['rubocop']
" let g:syntastic_javascript_checkers = ['jslint']

" Mappings
nnoremap <silent> <C-L> :nohls<cr>
nmap Q <nop>
nmap K <nop>
nmap U <nop>

" Remove trailing spaces
autocmd FileType ruby,eruby,javascript,jst,go autocmd BufWritePre <buffer> :%s/\s\+$//e

" Multiple cursors

let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      ='<F5>'
let g:multi_cursor_start_key           ='<F5>'
let g:multi_cursor_next_key            ='<C-n>'
let g:multi_cursor_prev_key            ='<C-p>'
let g:multi_cursor_skip_key            ='<C-k>'
let g:multi_cursor_quit_key            ='<Esc>'

" Powerline
let g:Powerline_symbols='fancy'

" ctrlp
set wildignore+=*/tmp/*
set wildignore+=vendor/bundle,vendor/ruby
set wildignore+=node_modules,bower_components
set wildignore+=*.png,*.jpg,*.gif,*.gem,*.o,*.so,*.swp,*.zip,*.log
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

" ctrlpBuffer
nnoremap <silent> <C-b> <CR>:CtrlPBuffer<cr>
" let g:ctrlp_show_hidden = 1

" gist
if has("macunix")
 let g:gist_clip_command = 'pbcopy'
else
 let g:gist_clip_command = 'xclip -selection clipboard'
endif

" rspec
au FileType ruby map <Leader>r :call RunCurrentSpecFile()<CR>
au FileType ruby map <Leader>s :call RunNearestSpec()<CR>
au FileType ruby let g:rspec_command = "!bundle exec rspec --drb {spec} --format documentation --color"

" Rainbow parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" NerdTree
"map <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <C-N> :NERDTreeToggle<CR>

syntax on
colorscheme onedark
let NERDTreeShowHidden=0
let g:NERDTreeIgnore = ['^node_modules$', '^bower_components$']

set list
set listchars=tab:>-

" Open and switches tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

let g:ag_working_path_mode="r"

if executable('ag')
 let g:ackprg = 'ag --vimgrep --smart-case'
 cnoreabbrev ag Ack
 cnoreabbrev aG Ack
 cnoreabbrev Ag Ack
 cnoreabbrev AG Ack
 cnoreabbrev Ack Ack!
endif

nnoremap <Leader>a :Ack!<Space>
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

nmap <C-T> <Plug>MarkdownPreviewToggle

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
