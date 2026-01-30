vim.lsp.config('helm_ls', {
    settings = {
        ['helm-ls'] = {
            valuesFiles = {
                mainValuesFile = "values.yaml",
                lintOverlayValuesFile = "values.lint.yaml",
                additionalValuesFilesGlobPattern = "values*.yaml"
            },
            helmLint = {
                enabled = true,
                ignoredMessages = {},
            },
            yamlls = {
                path = { "node", "yaml-language-server.js" },
            }
        }
    }
})
