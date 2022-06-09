local set = vim.opt

set.expandtab = true
set.exrc = true
set.hidden = true
set.incsearch = true
set.backup = false
set.errorbells = false
set.hlsearch = false
set.showmode = false
set.swapfile = false
set.wrap = false
set.nu = true
set.relativenumber = true
set.cursorline = true
set.cursorlineopt = 'number'
set.scrolloff = 8
set.shiftwidth = 4
set.signcolumn = 'yes'
set.smartindent = true
set.tabstop = 4
set.softtabstop = 4
set.termguicolors = true
set.undofile = true
set.wildmenu = true
vim.g.python3_host_prog = '~/.config/nvim/nvimpyenv/bin/python'
vim.g.mapleader = ' '
vim.g.syntax = true
set.termguicolors = true

vim.cmd([[
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

require('plugins')
require('plugconfig')
require('keymapping')
require('lsp-config')
--require('fileconfig.vim')

-- nightfly, onedarkpro, onedark
vim.cmd[[colorscheme catppuccin]]