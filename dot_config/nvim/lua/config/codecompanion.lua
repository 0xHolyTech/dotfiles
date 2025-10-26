require("codecompanion").setup({
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
    strategies = {
        chat = {
            adapter = "ollama",
        },
        inline = {
            adapter = "ollama",
        },
        cmd = {
            adapter = "ollama",
        },
    },
    opts = {
        log_level = "DEBUG", -- or "TRACE"
    }
})

vim.keymap.set("n", "<leader>cp", "<cmd>CodeCompanion<CR>", {})
vim.keymap.set("n", "<leader>ca", "<cmd>CodeCompanionActions<CR>", {})
vim.keymap.set("n", "<leader>cc", "<cmd>CodeCompanionChat<CR>", {})
vim.keymap.set("n", "<leader>cC", "<cmd>CodeCompanionCmd<CR>", {})
