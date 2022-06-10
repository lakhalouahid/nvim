-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'b3nj5m1n/kommentary'
  use 'vim-scripts/ReplaceWithRegister'
  use { "ellisonleao/gruvbox.nvim"}
  use 'tpope/vim-repeat'
  use 'tpope/vim-surround'
  use {'KabbAmine/vZoom.vim', {on = {'<Plug>(vzoom)', 'VZoomAutoToggle'}}}
  use {'jpalardy/vim-slime', ft = {'python'}}
  use {'hanschen/vim-ipython-cell', ft = {'python'}}
  use 'junegunn/goyo.vim'
  use 'rstacruz/vim-closer'
  use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
  use {'andymass/vim-matchup', event = 'VimEnter'}
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope-fzy-native.nvim'
  use 'nvim-telescope/telescope.nvim'

  -- nvim-lspconfig
  use 'nvim-treesitter/nvim-treesitter'
  use 'dmitmel/cmp-digraphs'
  use 'milisims/nvim-luaref'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-emoji'
  use 'hrsh7th/nvim-cmp'

  -- For luasnip users.
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'honza/vim-snippets'

  -- Awesome tpope Plugins
  use 'tpope/vim-fugitive'
  
  -- latex
  use 'xuhdev/vim-latex-live-preview'
  use 'lervag/wiki.vim'
  use 'lambdalisue/suda.vim'
end)
