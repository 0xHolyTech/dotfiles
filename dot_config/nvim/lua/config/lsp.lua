local function opt(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
end

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set('n', '<leader>jd', vim.lsp.buf.definition, opt 'Go to definition')
        vim.keymap.set('n', '<leader>jt', vim.lsp.buf.type_definition, opt 'Go to type definition')
        vim.keymap.set('n', '<leader>jl', vim.lsp.buf.references, opt 'List references of symbol')
        vim.keymap.set('n', '<leader>mh', vim.lsp.buf.hover, opt 'Displays hover about the symbol')
        vim.keymap.set('n', '<leader>ms', vim.lsp.buf.signature_help, opt 'Get signature_help')
        vim.keymap.set('n', '<leader>mf', vim.lsp.buf.format, opt 'Format buffer/file')
        vim.keymap.set('n', '<leader>ma', vim.lsp.buf.code_action, opt 'Select a code action')
        vim.keymap.set('n', '<leader>dh', vim.diagnostic.open_float, opt 'Open diagnostic window')
        vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, opt 'Move to next diagnostic')
        vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, opt 'Move to prev diagnostic')
    end,
})

vim.lsp.enable({'basedpyright', 'lua_ls', 'gopls', 'gdscript'})

