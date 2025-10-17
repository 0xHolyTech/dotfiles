require("aerial").setup({
    highlight_on_jump = 500,
    on_attach = function(bufnr)
        vim.keymap.set("n", "<leader>ta", "<cmd>AerialNavToggle<CR>")
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
    nav = {
        autojump = true,
        -- preview = true,
        keymaps = {
            ["<CR>"] = "actions.jump",
            ["<2-LeftMouse>"] = "actions.jump",
            ["<C-v>"] = "actions.jump_vsplit",
            ["<C-s>"] = "actions.jump_split",
            ["h"] = "actions.left",
            ["l"] = "actions.right",
            ["q"] = "actions.close",
        },
    },
})

