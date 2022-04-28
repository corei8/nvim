# neovim-config

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
let g:python3_host_prog='~/.config/nvim/nvimpyenv/bin/python'
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

call plug#begin()
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
Plug 'jbgutierrez/vim-better-comments'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'LumaKernel/ddc-tabnine'
Plug 'Chiel92/vim-autoformat'
Plug 'ahmedkhalf/project.nvim'
call plug#end()

let mapleader = " "

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

" Vim Fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //3<CR>
nmap <leader>gs :G<CR>
nmap <leader>ga :G add .<CR>

" NerdTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeQuitOnOpen = 1
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

" AirLine
" Note that I have added spaces to some of the symbols
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
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

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Project.vim
lua << EOF
  require("project_nvim").setup {
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
    show_hidden = false,
 }
EOF

" DDC
call ddc#custom#patch_global('sources', ['around'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ })
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
      \ 'clangd': {'mark': 'C'},
      \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
      \ 'around': {'maxSize': 100},
      \ })
inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'
call ddc#custom#patch_global('sources', ['tabnine'])
call ddc#custom#patch_global('sourceOptions', {
    \ 'tabnine': {
    \   'mark': 'TN',
    \   'maxCandidates': 5,
    \   'isVolatile': v:true,
    \ }})
call ddc#enable()
```
