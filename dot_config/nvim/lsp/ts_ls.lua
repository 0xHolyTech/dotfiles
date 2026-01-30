local vue_typescript_plugin = vim.fn.expand(vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server")

vim.lsp.config('ts_ls', {
    cmd = { 'typescript-language-server', '--stdio' },
    filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'typescript.jsx', 'javascript.jsx', 'vue' },
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                location = vue_typescript_plugin,
                languages = { "vue" },
            },
        },
    },
})
