local harpoon = require("harpoon")
harpoon:setup({
    default = {
        get_root_dir = function ()
            local cwd = vim.loop.cwd()
            local root = vim.fn.system("git rev-parse --show-toplevel")
            if vim.v.shell_error == 0 and root ~= nil then
                return string.gsub(root, "\n", "")
            end
            return cwd
        end
        },
    settings = {
        save_on_toggle = false,
        sync_on_ui_close = false,
        key = function()
            local cwd = vim.loop.cwd()
            local root = vim.fn.system("git rev-parse --show-toplevel")
            if vim.v.shell_error == 0 and root ~= nil then
                return root
            end
            return cwd
        end,
    },
})


vim.keymap.set("n", "<leader>ea", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>ee", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>e1", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>e2", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>e3", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>e4", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<leader>ep", function() harpoon:list():prev() end)
vim.keymap.set("n", "<leader>en", function() harpoon:list():next() end)

