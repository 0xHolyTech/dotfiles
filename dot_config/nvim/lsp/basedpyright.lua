return {
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
}
