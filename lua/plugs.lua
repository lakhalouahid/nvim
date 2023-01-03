-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'folke/tokyonight.nvim'
    use 'b3nj5m1n/kommentary'
    use 'vim-scripts/ReplaceWithRegister'
    use 'tpope/vim-repeat'
    use 'tpope/vim-surround'
    use {'KabbAmine/vZoom.vim', {on = {'<Plug>(vzoom)', 'VZoomAutoToggle'}}}
    use {'jpalardy/vim-slime'}
    use {'hanschen/vim-ipython-cell'}


    use {'andymass/vim-matchup', event = 'VimEnter'}
    use 'nvim-lua/plenary.nvim'


    -- nvim-lspconfig
    use 'nvim-treesitter/nvim-treesitter'
    use 'dmitmel/cmp-digraphs'
    use 'milisims/nvim-luaref'
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-emoji'
    use 'hrsh7th/nvim-cmp'

    -- For luasnip users.
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'honza/vim-snippets'

    -- Awesome tpope Plugins
    use 'tpope/vim-fugitive'

    -- easy align
    use 'RRethy/nvim-align'

    -- latex
    use {'xuhdev/vim-latex-live-preview', opt = true, ft = {'tex'}}
    use 'lambdalisue/suda.vim'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use "lukas-reineke/indent-blankline.nvim"
    use 'lervag/wiki.vim'
    use "windwp/nvim-autopairs"
    use 'kana/vim-textobj-entire'
    use 'kana/vim-textobj-user'

    -- install without yarn or npm
    use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
    })

    use {
        'nvim-lualine/lualine.nvim',
        'kyazdani42/nvim-web-devicons'
    }

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })
end)
