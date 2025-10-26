require("codecompanion").setup({
    strategies = {
        chat = {
            name = "ollama",
            model = "qwen3-coder:30b",
        },
        inline = {
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
