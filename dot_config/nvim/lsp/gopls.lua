return {
    cmd = { 'gopls' },
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true
            },
        },
    }
}
