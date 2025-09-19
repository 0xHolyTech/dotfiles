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
        { 'terryma/vim-multiple-cursors' }, -- v mode C-n
        {
            "m4xshen/hardtime.nvim",
            lazy = false,
            dependencies = { "MunifTanjim/nui.nvim" },
            opts = {},
        },
        {
            "folke/noice.nvim",
            event = "VeryLazy",
            opts = {
                -- add any options here
            },
            dependencies = {
                -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
                "MunifTanjim/nui.nvim",
                -- OPTIONAL:
                --   `nvim-notify` is only needed, if you want to use the notification view.
                --   If not available, we use `mini` as the fallback
                "rcarriga/nvim-notify",
            }
        },
        {
            "yetone/avante.nvim",
            build = "make",
            event = "VeryLazy",
            version = false, -- Never set this value to "*"! Never!
            ---@module 'avante'
            ---@type avante.Config
            opts = {
                instructions_file = "avante.md",
                provider = "ollama",
                providers = {
                    ollama = {
                        endpoint = "http://127.0.0.1:11434", -- Note that there is no /v1 at the end.
                        model = "qwen2.5-coder:3b",
                    },
                },
            },
            dependencies = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
                --- The below dependencies are optional,
                "echasnovski/mini.pick", -- for file_selector provider mini.pick
                "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
                "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
                "ibhagwan/fzf-lua", -- for file_selector provider fzf
                "stevearc/dressing.nvim", -- for input provider dressing
                "folke/snacks.nvim", -- for input provider snacks
                "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
                {
                    "HakonHarnes/img-clip.nvim",
                    event = "VeryLazy",
                    opts = {
                        default = {
                            embed_image_as_base64 = false,
                            prompt_for_file_name = false,
                            drag_and_drop = {
                                insert_mode = true,
                            },
                        },
                    },
                },
                {
                    'MeanderingProgrammer/render-markdown.nvim',
                    opts = {
                        file_types = { "markdown", "Avante" },
                    },
                    ft = { "markdown", "Avante" },
                },
            },
        },
        {
            dir = '~/Public/amai.nvim',
        },
        {
            dir = '~/Public/shortcuts.nvim',
        },
    },
    checker = { enabled = false },
})

