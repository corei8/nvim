# neovim-config

## With Comments

```vim
" corei8.github@gmail.com neovim configuration

" tabs
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set exrc
set guicursor=i:block
set nu
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap

" file history
set noswapfile
set nobackup
set undofile

" search
set incsearch

" gui
set termguicolors
set scrolloff=8
set noshowmode
set colorcolumn=79
set signcolumn=yes

" clipboard
set clipboard=unnamedplus

set completeopt=menuone,noinsert,noselect

call plug#begin('~/.vim/plugged')

" File managing
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive'

" UI
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" telescope 
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" Commenting
Plug 'scrooloose/nerdcommenter'

" colorscheme
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'

" comments
Plug 'jbgutierrez/vim-better-comments'

Plug 'tpope/vim-surround'

" Better Visual Guide
Plug 'Yggdroot/indentLine'

" syntax check
Plug 'w0rp/ale'

" Autocomplete
Plug 'valloric/youcompleteme'

" Formater
Plug 'Chiel92/vim-autoformat'

" Project Management
Plug 'ahmedkhalf/project.nvim'

call plug#end()

set termguicolors
highlight Normal guibg=none
let g:onedark_italic=1
colorscheme onedark
set background=dark
hi Normal guibg=NONE ctermbg=NONE
let g:terminal_ansi_colors = [
    \ '#282828', '#cc241d', '#98971a', '#d79921',
    \ '#458588', '#b16286', '#689d6a', '#a89984',
    \ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
    \ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
\]

let mapleader = " "

" easier way to choose buffers:
nnoremap <leader>b :b<CR>

" Vim Fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //3<CR>
nmap <leader>gs :G<CR>

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1
let g:NERDTreeGitStatusUseNerdFonts = 1
" open NerdTree on startup
" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree
" open NerdTree on the current file
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
" close NerdTree upon opening a file
let NERDTreeQuitOnOpen = 1
" close tab if the only remaining window is NerdTree
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" delete buffer of deleted file in NerdTree
let NERDTreeAutoDeleteBuffer = 2
" some stuff for looks
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" NerdTree git plugin icon adjustment
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" AirLine
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline_theme='onedark'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '  '
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty=' ⚡ '

" Python 
augroup python_files
    autocmd!
    autocmd FileType python setlocal noexpandtab
    autocmd FileType python set tabstop=4
    autocmd FileType python set shiftwidth=4
augroup END

filetype plugin indent on

" vim-autoformat
noremap <F3> :Autoformat<CR>

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" Autocomplete for ncm2
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
  require("project_nvim").setup {
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    show_hidden = false,
 }
EOF

" Commands for vim-plug:
" PlugInstall
" PlugUpdate
" PlugStatus
" PlugClean
" PlugUpgrade

```

## Compact:

```vim
" corei8.github@gmail.com neovim configuration

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set exrc
set guicursor=i:block
set nu
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set colorcolumn=79
set signcolumn=yes
set clipboard=unnamedplus
set completeopt=menuone,noinsert,noselect

call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'scrooloose/nerdcommenter'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim'
Plug 'jbgutierrez/vim-better-comments'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'valloric/youcompleteme'
Plug 'Chiel92/vim-autoformat'
Plug 'ahmedkhalf/project.nvim'
call plug#end()

set termguicolors
highlight Normal guibg=none
let g:onedark_italic=1
colorscheme onedark
set background=dark
hi Normal guibg=NONE ctermbg=NONE
let g:terminal_ansi_colors = [
    \ '#282828', '#cc241d', '#98971a', '#d79921',
    \ '#458588', '#b16286', '#689d6a', '#a89984',
    \ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
    \ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
\]
let mapleader = " "
nnoremap <leader>b :b<CR>
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //3<CR>
nmap <leader>gs :G<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeRespectWildIgnore=1
let g:NERDTreeGitStatusUseNerdFonts = 1
autocmd VimEnter * NERDTree
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeAutoDeleteBuffer = 2
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='onedark'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = '  '
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty=' ⚡ '
augroup python_files
    autocmd!
    autocmd FileType python setlocal noexpandtab
    autocmd FileType python set tabstop=4
    autocmd FileType python set shiftwidth=4
augroup END
filetype plugin indent on
noremap <F3> :Autoformat<CR>
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
lua << EOF
  require("project_nvim").setup {
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    show_hidden = false,
 }
EOF

```
