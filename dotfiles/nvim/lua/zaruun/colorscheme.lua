-- set colorscheme to nightfly with protected call
-- in case it isn't installed
-- nightfly molokai tokyonight
local status, _ = pcall(vim.cmd, "colorscheme nightfly")
-- local status, _ = pcall(vim.cmd, "colorscheme molokai")
-- local status, _ = pcall(vim.cmd, "colorscheme tokyonight")
if not status then
	print("Colorscheme not found!") -- print error if colorscheme not installed
	return
end

