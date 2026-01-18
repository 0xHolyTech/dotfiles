require('shortcuts').setup(
    {
        override = true,
        defaults = {
            empty = {},
            default = {},
            python = {
                n = {
                    l = {
                      command_type = "async",
                      async_type = "run",
                      command = "uv run black ."
                    }
                }
            },
            docker = {
                n = {
                    b = {
                      command_type = "async",
                      async_type = "term",
                      command = "docker compose build"
                    },
                    u = {
                      command_type = "async",
                      async_type = "run",
                      command = "docker compose up -d",
                      notify = true
                    },
                    d = {
                      command_type = "async",
                      async_type = "run",
                      command = "docker compose down",
                      notify = true
                    },
                },
            },
            golang = {
                n = {
                    u = {
                        command_type = "async",
                        async_type = "term",
                        command = "go run main.go",
                    },
                    b = {
                        command_type = "async",
                        async_type = "term",
                        command = "go build main.go",
                    },
                },
            },
            lua = {
                n = {
                    l = {
                        command = "print('Example lua command')",
                        command_type = "lua",
                    }
                }
            }
        },
    }
)

vim.keymap.set('n', '<leader>aa', '<Cmd>ShortcutsToggle<CR>')

