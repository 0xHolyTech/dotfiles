vim.o.foldcolumn = '0'
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.keymap.set('n', '<leader>ff', "za")
vim.keymap.set('n', '<leader>fO', require('ufo').openAllFolds)
vim.keymap.set('n', '<leader>fC', require('ufo').closeAllFolds)

-- https://github.com/kevinhwang91/nvim-ufo?tab=readme-ov-file#minimal-configuration
require('ufo').setup({
    provider_selector = function(_, _, _)
        return {'treesitter', 'indent'}
    end
})
