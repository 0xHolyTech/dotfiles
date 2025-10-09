local projectfile = vim.fn.getcwd() .. '/project.godot'
if io.open(projectfile,"r") ~= nil then
	vim.fn.serverstart './.godotsocket'
end
