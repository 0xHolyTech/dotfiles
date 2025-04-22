local ld = require('lazydocker')

vim.keymap.set('n', '<leader>lg', vim.cmd.LazyGit)
vim.keymap.set('n', '<leader>ld', '<Cmd>lua LazyDocker.toggle()<CR>')

-- Default configuration
ld.setup({
  window = {
    settings = {
      width = 0.9, -- Percentage of screen width (0 to 1)
      height = 0.9, -- Percentage of screen height (0 to 1)
      border = 'rounded', -- See ':h nvim_open_win' border options
      relative = 'editor', -- See ':h nvim_open_win' relative options
    },
  },
})

