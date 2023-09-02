vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { 'vim-scripts/argtextobj.vim', as = 'argtextobj' }
    use { 'kristijanhusak/vim-dadbod-ui', as = 'vim-dadbod-ui' }

    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }

    use { 'nvim-treesitter/nvim-treesitter', as = 'nvim-treesitter', run = ':TSUpdate' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },             -- Required
            { 'williamboman/mason.nvim' },           -- Optional
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp',                 as = 'cmp' }, -- Required
            { 'hrsh7th/cmp-nvim-lsp' },                         -- Required
            { 'L3MON4D3/LuaSnip' },                             -- Required
        }
    }
end)
