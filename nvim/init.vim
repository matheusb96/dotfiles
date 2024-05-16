" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Install plugins with vim-plug https://github.com/junegunn/vim-plug
" Reload and runs :PlugInstall to install plugins

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tomtom/tcomment_vim'
Plug 'mileszs/ack.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'morhetz/gruvbox'
Plug 'slim-template/vim-slim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'
Plug 'tpope/vim-rails'
Plug 'github/copilot.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'olimorris/neotest-rspec'
Plug 'alvan/vim-closetag'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'

" Themes
Plug 'Luxed/ayu-vim'

call plug#end()

" Use The Silver Searcher if available
" https://github.com/ggreer/the_silver_searcher
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif

" -- Configurations --

" Enable syntax highlighting
syntax on
set termguicolors

" Don't wrap long lines
set nowrap

" Use 2 spaces for tabs
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab

" Enable ruler
set ru

" Enable mouse
set mouse=a
set encoding=UTF-8
set clipboard+=unnamedplus

" Automatically remove all trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Set default colorscheme to solarized
let ayucolor="mirage" " for mirage version of theme
colorscheme ayu

" Enable line numbers and don't make them any wider than necessary
set number numberwidth=2

" Set GUI font
" get the Fira Code font from https://github.com/tonsky/FiraCode
if has('gui_running')
  if executable('fc-list')
    let font_exists = system('fc-list | grep -i -q "Fira Code Retina"')

    if font_exists == 0
      set guifont=Fira_Code_Retina:h13
    else
      set guifont=Monaco:h13
    endif
  endif
endif

" -- Mappings --

" Toggle NERDTreeToggle
nmap <Leader>g :NERDTreeToggle<CR>

" Switch between panes
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" Mapping CtrlP command
nnoremap <Leader>b :<C-U>CtrlPBuffer<CR>
nnoremap <Leader>t :<C-U>CtrlP<CR>

" Removing highlited search
nnoremap <silent> <C-L> :nohls<cr>

" Telescope finders & grep
nnoremap <leader>ff <cmd>Telescope find_files<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>

" Autoclose tags
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.erb'
let g:closetag_filetypes = 'html,xhtml,phtml,erb'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'

" Moving line to up/down
noremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

source $HOME/.config/nvim/lsp.vim
source $HOME/.config/nvim/telescope.vim
source $HOME/.config/nvim/completion.vim


