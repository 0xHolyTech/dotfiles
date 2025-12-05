require('mason').setup({
  ensure_installed = {
      "black",
      "debugpy",
      "shellcheck", -- Doesn't work with null_ls, manually install
      "yamlfmt",
  },
})
require('mason-lspconfig').setup({
    ensure_installed = {
        "astro",
        "basedpyright",
        "bashls",
        "dockerls",
        "docker_compose_language_service",
        "gopls",
        "helm_ls",
        "lua_ls",
        "nginx_language_server",
        "postgres_lsp",
        "terraformls",
        "ts_ls",
        "yamlls",
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

