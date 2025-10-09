require("dapui").setup()

vim.api.nvim_create_user_command("DapUiToggle", function()
  require("dapui").toggle()
end, {})

vim.keymap.set('n', '<leader>dt', '<cmd>DapUiToggle<CR>', {noremap=true})
vim.keymap.set('n', '<leader>db', '<cmd>DapToggleBreakpoint<CR>', {noremap=true})
vim.keymap.set('n', '<leader>dc', '<cmd>DapContinue<CR>', {noremap=true})

