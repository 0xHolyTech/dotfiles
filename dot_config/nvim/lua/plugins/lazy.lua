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
        }, -- er terminal file explorer ontop of nvim
        {
            'kdheepak/lazygit.nvim',
            dependencies = {
                'nvim-lua/plenary.nvim',
            },
        }, -- lg + terminal shortcuts + lazygit shortcuts TODO (Configure)
        {
            'crnvl96/lazydocker.nvim',
            opts={},
            dependencies = {
                'MunifTanjim/nui.nvim'
            },
        }, -- ld + terminal shortcuts + lazydocker shortcuts TODO (Configure)
        {
            'nvim-telescope/telescope.nvim', tag = '0.1.4',
            dependencies = {{ 'nvim-lua/plenary.nvim' }}
        }, -- sF (find term in project) sf (find files in project) sg (find git)
        { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
        -- {
        --     'theprimeagen/harpoon',
        --     branch = "harpoon2",
        --     requires={ {"nvim-lua/plenary.nvim"} },
        -- }, -- ee/ea/e#
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
        {
            'kylechui/nvim-surround',
            -- tag = '*',
            config = function()
                require('nvim-surround').setup({})
            end
        }, -- ysiw" (one word) yse" (vim motion e example) ys$" (vim motion $ example) cs'" (change ' to " example) ds" (remove " example) dsf (delete function??)
        {
            'Wansmer/treesj',
            dependencies = { 'nvim-treesitter/nvim-treesitter' },
            config = function()
                require('treesj').setup({
                    use_default_keymaps = false,
                    dot_repeat = false,
                })
            end
        }, -- <leader>sj (join) <leader>ss (split)
        {
            'linux-cultist/venv-selector.nvim',
            dependencies = {
                'neovim/nvim-lspconfig',
                { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }
            },
            lazy = false,
            branch = 'regexp',
            keys = {
                { "<leader>mv", "<cmd>VenvSelect<cr>" }, -- Open picker on keymap
            },
        }, -- <leader>mv change current venv environment
        { 'f-person/git-blame.nvim' },
        { 'terryma/vim-multiple-cursors' }, -- v mode C-n
        {
            'folke/trouble.nvim',
            opts = {},
            cmd = "Trouble",
            config = function()
                require('trouble').setup({})
            end
        }, -- td toggle diagnostics
        { 'laytan/cloak.nvim' },
        {
            'lervag/vimtex',
            lazy = false,
            init = function()
                vim.g.vimtex_view_method = 'zathura'
                vim.g.vimtex_view_general_viewer = 'okular'
            end
        },
        {
            'rcarriga/nvim-dap-ui',
            dependencies = {
                'mfussenegger/nvim-dap',
                'nvim-neotest/nvim-nio',
            },
        },
        -- {
        --     "3rd/image.nvim",
        --     build = false,
        --     opts = {
        --         processor = "magick_cli",
        --         integrations = {
        --             markdown = {
        --                 only_render_image_at_cursor = true,
        --                 only_render_image_at_cursor_mode = "inline",
        --                 clear_in_insert_mode = true,
        --             },
        --         },
        --     }
        -- },
        {
            dir = '~/Public/amai.nvim',
        },
        {
            'HolyTechGH/shortcuts.nvim',
        }
    },
    checker = { enabled = false },
})

