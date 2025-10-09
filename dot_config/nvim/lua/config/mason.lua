require('mason').setup({
  ensure_installed = {
      "black",
      "yamlfmt",
      "debugpy",
      "shellcheck", -- Doesn't work with null_ls, manually install
  },
})
require('mason-lspconfig').setup({
    ensure_installed = {
        "gopls",
        "basedpyright",
        "dockerls",
        "yamlls",
        "bashls",
        "lua_ls",
    },
    handlers = {
        function(server_name)
            vim.lsp.config(server_name).setup({})
        end,
    },
})

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.yamlfmt.with({
            extra_args = { "-formatter", "indent=4" },
        }),
    }
})

require('mason-null-ls').setup({
    automatic_installation = true,
})

vim.keymap.set('n', '<leader>mo', '<cmd>Mason<CR>')

