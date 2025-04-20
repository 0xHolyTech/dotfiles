local harpoon = require("harpoon")
harpoon:setup()

-- local mark = require('harpoon.mark')
-- local ui = require('harpoon.ui')
--
vim.keymap.set("n", "<leader>ea", function() harpoon:list():add() end)
-- vim.keymap.set('n', '<leader>ea', mark.add_file)
vim.keymap.set("n", "<leader>ee", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
-- vim.keymap.set('n', '<leader>ee', ui.toggle_quick_menu)
--
--
vim.keymap.set("n", "<leader>e1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>e2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>e3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>e4", function() harpoon:list():select(4) end)
-- vim.keymap.set('n', '<leader>e1', function() ui.nav_file(1) end)
-- vim.keymap.set('n', '<leader>e2', function() ui.nav_file(2) end)
-- vim.keymap.set('n', '<leader>e3', function() ui.nav_file(3) end)
-- vim.keymap.set('n', '<leader>e4', function() ui.nav_file(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
