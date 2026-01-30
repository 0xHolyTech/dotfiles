vim.lsp.config('basedpyright', {
    settings = {
        basedpyright = {
            analysis = {
                diagnosticSeverityOverrides = {
                    reportPrivateLocalImportUsage = "none",
                    reportImplicitRelativeImport = "none",
                    reportIgnoreCommentWithoutRule = "none",
                }
            },
        },
    },
})
