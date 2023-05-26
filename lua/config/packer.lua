-- This file can be loaded by calling `lua require('plugins':q)` from your init.vim

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

-- local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    -- barbar
    use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
    use 'lewis6991/gitsigns.nvim'     -- OPTIONAL: for git status
    use 'romgrk/barbar.nvim'
    use("nvim-treesitter/nvim-treesitter")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use("nvim-treesitter/nvim-treesitter-context");
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use("nvim-treesitter/playground")
    -- below line
    use({
        "glepnir/galaxyline.nvim",
        -- some optional icons
        requires = { "nvim-tree/nvim-web-devicons", opt = true }
    })
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    use({ "folke/zen-mode.nvim" })
    use({ "eandrju/cellular-automaton.nvim" })
    use({ "github/copilot.vim" })
    use({ "laytan/cloak.nvim" })

    -- color scheme
    use { "ellisonleao/gruvbox.nvim" }
    -- for commenting
    use { "numToStr/Comment.nvim" }

    -- neotree
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            {
                -- only needed if you want to use the commands with "_with_window_picker" suffix
                's1n7ax/nvim-window-picker',
                tag = "v1.*",
                config = function()
                    require 'window-picker'.setup({
                        autoselect_one = true,
                        include_current = false,
                        filter_rules = {
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { 'terminal', "quickfix" },
                            },
                        },
                        other_win_hl_color = '#e35e4f',
                    })
                end,
            }
        }
    }
    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }
end)
