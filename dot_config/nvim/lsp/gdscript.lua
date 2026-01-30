vim.lsp.config('gdscript', {
    force_setup = true, -- because the LSP is global. Read more on lsp-zero docs about this.
    single_file_support = false,
    vim.lsp.rpc.connect('127.0.0.1', 6005),
    root_markers = { 'project.godot', '.git' },
    filetypes = {'gd', 'gdscript', 'gdscript3' },
})
