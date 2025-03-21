-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
        if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { "folke/tokyonight.nvim", config = function() vim.cmd.colorscheme "tokyonight" end },
        {
            "mikavilpas/yazi.nvim",
            event = "VeryLazy",
            dependencies = { "folke/snacks.nvim", lazy = true },
            opts = {
                open_for_directories = false,
                keymaps = {
                    show_help = "<f1>",
                },
            },
            init = function()
                vim.g.loaded_netrwPlugin = 1
            end
        },
        {
            'kdheepak/lazygit.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
            },
        }, -- lg + terminal shortcuts + lazygit shortcuts TODO (Configure)
        {
            'crnvl96/lazydocker.nvim',
            config = function()
                require('lazydocker').setup()
            end,
            dependencies = {
                'MunifTanjim/nui.nvim'
            },
        }, -- ld + terminal shortcuts + lazydocker shortcuts TODO (Configure)
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.4',
            dependencies = {{ 'nvim-lua/plenary.nvim' }}
        }, -- sf (find) sF (find files) sg (find git)
        { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
        { 'theprimeagen/harpoon' }, -- ee/ea/e#
        { 'mbbill/undotree' }, -- tu
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
        },
        {
            'max397574/better-escape.nvim',
            config = function()
                require('better_escape').setup({
                    mappings = {
                        t = {
                            j = {
                                k = false,
                                j = false
                            }
                        }
                    }
                })
            end,
        }, -- insert or command mode jj/jk TODO Remove for actual shortcuts
        {
            'lewis6991/gitsigns.nvim',
            config = function()
                require('gitsigns').setup()
            end,
        },
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            dependencies = {
                {'neovim/nvim-lspconfig'},
                {'hrsh7th/nvim-cmp'},
                {'hrsh7th/cmp-nvim-lsp'},
                {'L3MON4D3/LuaSnip'},
            }
        },
        { 'williamboman/mason-lspconfig.nvim' },
        {
            'jay-babu/mason-null-ls.nvim',
            dependencies = {
                'williamboman/mason.nvim',
                'nvimtools/none-ls.nvim',
            },
        },
        { 'gbprod/none-ls-shellcheck.nvim' },
        { 'rcarriga/nvim-dap-ui', dependencies = {'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio'} },
        {
            'kylechui/nvim-surround',
            -- tag = '*',
            config = function()
                require('nvim-surround').setup({})
            end
        }, -- ysiw" ysi" ys$" cs'" ds" dsf (function calls)
        {
            'Wansmer/treesj',
            dependencies = { 'nvim-treesitter/nvim-treesitter' },
            config = function()
                require('treesj').setup({
                    use_default_keymaps = false,
                    dot_repeat = false,
                })
            end
        }, -- <leader>j (join) <leader>s (split)
        {
            'linux-cultist/venv-selector.nvim',
            dependencies = {
                'neovim/nvim-lspconfig',
                { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }
            },
            lazy = false,
            branch = 'regexp',
            config = function()
                require('venv-selector').setup()
                vim.keymap.set('n', '<leader>mv', '<cmd>VenvSelect<CR>')
            end,
        },
        { 'f-person/git-blame.nvim' },
        {
            'akinsho/toggleterm.nvim',
            -- tag = '*',
            config = function()
                require('toggleterm').setup()
            end
        }, -- et (TODO Replace)
        { 'terryma/vim-multiple-cursors' }, -- v mode C-n
        { 'preservim/tagbar' }, -- tt toggle tagbar
        {
            'folke/trouble.nvim',
            opts = {},
            cmd = "Trouble",
            config = function()
                require('trouble').setup({})
            end
        }, -- td toggle diagnostics
        { 'laytan/cloak.nvim' },
    },
})

