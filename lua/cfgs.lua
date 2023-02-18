cmd('set ruler')
cmd('set nowrap')
cmd('set encoding=utf-8')
cmd('set nocompatible')
cmd('set title')
cmd('set hidden')
cmd('set scrolloff=0')
cmd('set signcolumn=no')
cmd('set colorcolumn=0') cmd('set cmdheight=1')
cmd('set shortmess+=c')
cmd('set noshowmode')
cmd('set nohlsearch')
cmd('set completeopt=menuone,noinsert,noselect')
cmd('set exrc')
cmd('set nowrapscan')
cmd('set updatetime=200')
cmd('set belloff=all')
-- cmd('syntax enable')
cmd('filetype on')
cmd('filetype plugin on')
cmd('filetype indent on')

--[[ cmd('let &t_8f = "<Esc>[38;2;%lu;%lu;%lum"')
cmd('let &t_8b = "<Esc>[48;2;%lu;%lu;%lum"') ]]


-- lua
cmd('set expandtab')
cmd('set tabstop=4')
cmd('set shiftwidth=4')
cmd('set smarttab')
cmd('set smartindent')
cmd('set autoindent')
cmd('set relativenumber')
cmd('set number')
cmd('set spelllang=en_us')
cmd('set termguicolors')
cmd('set path=.**')
cmd('set wildmode=longest:list')
cmd('set wildignore+=*.pyc')
cmd('set wildignore+=*build/*')
cmd('set wildignore+=**/coverage/*')
cmd('set wildignore+=**/__pycache__/*')
cmd('set wildignore+=**/node_modules/*')
cmd('set wildignore+=**/.git/*')
cmd('set numberwidth=4')

cmd('set incsearch')
cmd('set history=700')
cmd('set undolevels=700')
cmd('set noswapfile')
cmd('set nobackup')
cmd('set undofile')
cmd('set undodir=$HOME/.local/share/nvim/undodir')

cmd('set clipboard=unnamedplus')
cmd('let g:loaded_ruby_provider=0')
cmd('let g:loaded_perl_provider=0')
cmd('let g:loaded_python_provider=0')
cmd('let g:python_recommended_style=0')
cmd('set rtp+=$HOME/.local/share/nvim/lua')
cmd('set rtp+=$HOME/.config/nvim')
cmd('set mouse=n')



-- stuff
vim.g.loaded_ruby_provider=0
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR=1
vim.g.mapleader=' '
vim.g.maplocalleader=' '
vim.g.mkdp_browser='google-chrome'


-- vim.o.statusline = "%f %= %l,%c %= %p%%"
-- colorscheme
require('cfgs.colorscheme')
-- cmd[[colorscheme catppuccin]]
cmd('highlight WinSeparator guifg=None') 

require('cfgs.slime')
require('cfgs.vim-latex-live-preview')
require('cfgs.vimwiki')
require('cfgs.evil_lualine')

cmd('set cmdheight=1')
