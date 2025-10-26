-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
    local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
            { out, 'WarningMsg' },
            { '\nPress any key to exit...' },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

vim.opt.rtp:prepend(lazypath)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('lazy').setup({
    spec = {
        { 'folke/tokyonight.nvim', config = function() vim.cmd.colorscheme 'tokyonight' end },
        {
            'mikavilpas/yazi.nvim',
            event = 'VeryLazy',
            dependencies = {
                'folke/snacks.nvim',
                lazy = true,
                opts = {
                    notifier = {
                        enabled = false,
                    },
                },
            },
            opts = {
                open_for_directories = false,
                keymaps = {
                    show_help = '<f1>',
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
            'neovim/nvim-lspconfig',
            dependencies = {
                'williamboman/mason-lspconfig.nvim',
                'hrsh7th/cmp-nvim-lsp',
                'L3MON4D3/LuaSnip',
            },
        },
        {
            'jay-babu/mason-null-ls.nvim',
            dependencies = {
                'williamboman/mason.nvim',
                'nvimtools/none-ls.nvim',
            },
        },
        -- { 'gbprod/none-ls-shellcheck.nvim' },
        {
            'rafamadriz/friendly-snippets',
            dependencies = { 'L3MON4D3/LuaSnip' },
            config = function()
                require('luasnip.loaders.from_vscode').lazy_load({ paths = { vim.fn.stdpath('config') .. '/snippets' } })
            end,
        },
        {
            'saghen/blink.cmp',
            version = '1.*',
            dependencies = { 'hrsh7th/nvim-cmp' },
            opts = {
                snippets = { preset = 'luasnip' },
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                },
                fuzzy = { implementation = 'prefer_rust_with_warning' },
                -- See :h blink-cmp-config-keymap for defining your own keymap
                keymap = {
                    preset = 'enter',
                    ['<Tab>'] = {
                        function(cmp)
                            if cmp.is_menu_visible() then
                                return cmp.select_next()
                            elseif has_words_before() then
                                return cmp.show()
                            end
                        end,
                        'fallback',
                    },
                    ['<Enter>'] = {
                        function(cmp)
                            if cmp.is_menu_visible() then
                                return cmp.accept()
                            elseif cmp.snippet_active() then
                                return cmp.snippet_forward()
                            end
                        end,
                        'fallback',
                    },
                    ['<S-Tab>'] = { 'select_prev', 'fallback' },
                    ['<C-j>'] = { 'scroll_documentation_up', 'fallback' },
                    ['<C-k>'] = { 'scroll_documentation_down', 'fallback' },
                },
                completion = {
                    menu = { auto_show = false },
                    ghost_text = {
                        enabled = true,
                        show_without_selection = false,
                        show_without_menu = false,
                    },
                    documentation = {
                        auto_show = true,
                        auto_show_delay_ms = 100,
                    },
                },
            },
            opts_extend = { 'sources.default' }
        },
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
                    max_join_length = 200,
                })
            end,
        }, -- <leader>sj (join) <leader>ss (split)
        {
            'linux-cultist/venv-selector.nvim',
            dependencies = {
                'neovim/nvim-lspconfig',
                { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } }
            },
            ft = "python",
            branch = 'main',
            keys = {
                { '<leader>mv', '<cmd>VenvSelect<cr>' }, -- Open picker on keymap
            },
            opts = {},
        }, -- <leader>mv change current venv environment
        { 'f-person/git-blame.nvim' },
        {
            'folke/trouble.nvim',
            opts = {},
            cmd = 'Trouble',
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
            'm4xshen/hardtime.nvim',
            lazy = false,
            dependencies = { 'MunifTanjim/nui.nvim' },
            opts = {},
        },
        {
            'folke/noice.nvim',
            event = 'VeryLazy',
            opts = {},
            dependencies = {
                'MunifTanjim/nui.nvim',
                'rcarriga/nvim-notify',
            }
        },
        {
            'stevearc/aerial.nvim',
            opts = {},
            dependencies = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-tree/nvim-web-devicons"
            },
        }, -- <leader>ta open aerial menu
        {
            "olimorris/codecompanion.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
                "ravitemer/mcphub.nvim",
            },
            adapters = {
                http = {
                    ollama = function()
                        return require("codecompanion.adapters").extend("ollama", {
                            schema = {
                                model = {
                                    default = "qwen3-coder:30b",
                                },
                            },
                        })
                    end,
                },
            },
        },
        {
            'skywind3000/asyncrun.vim',
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


