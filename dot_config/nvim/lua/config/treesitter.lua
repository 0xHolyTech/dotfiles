require'nvim-treesitter.configs'.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "typescript", "python", "go" },
  sync_install = false,
  auto_install = true,
  ignore_install = { "javascript" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.wasp = {
  install_info = {
    url = "https://github.com/bx2/tree-sitter-wasp", -- local path or git repo
    files = {"src/parser.c"}, -- note that some parsers also require src/scanner.c or src/scanner.cc
    branch = "main", -- default branch in case of git repo if different from master
    generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
  },
  filetype = "wasp", -- if filetype does not match the parser name
}

require'treesitter-context'.setup {
    enable = true,
    miltiwindow = false,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    mode = 'topline',
    separator = nil,
}

vim.keymap.set('n', '<leader>sj', '<cmd>TSJJoin<CR>')
vim.keymap.set('n', '<leader>ss', '<cmd>TSJSplit<CR>')
vim.keymap.set("v", "<TAB>", ">gv")
vim.keymap.set("v", "<S-TAB>", "<gv")

