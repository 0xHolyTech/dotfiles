-- ~/.config/yazi/init.lua
require("bookmarks"):setup({
	last_directory = { enable = true, persist = true, mode="dir" },
	persist = "all",
	desc_format = "parent",
	file_pick_mode = "parent",
	custom_desc_input = true,
	notify = {
		enable = false,
	},
})

