require('tuxedo').setup {
	create_todo_file = true,
	width_ratio = 0.95,
	height_ratio = 0.80,
}
vim.keymap.set('n', '<leader>lt', '<Cmd>Tuxedo<CR>')
