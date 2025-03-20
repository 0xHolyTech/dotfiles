-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { "folke/tokyonight.nvim", config = function() vim.cmd.colorscheme "tokyonight" end },
    {
      "mikavilpas/yazi.nvim",
      event = "VeryLazy",
      dependencies = { "folke/snacks.nvim", lazy = true },
      keys = {
        {
          "<leader>E",
          mode = { "n", "v" },
          "<cmd>Yazi<cr>",
          desc = "Open yazi at the current file",
        },
        {
          "<leader>e",
	  mode = { "n", "v" },
          "<cmd>Yazi toggle<cr>",
          desc = "Resume the last yazi session",
        }
      },
      opts = {
        open_for_directories = false,
        keymaps = {
          show_help = "<f1>",
        },
      },
      init = function()
        vim.g.loaded_netrwPlugin = 1
      end,
    }
  },
})

