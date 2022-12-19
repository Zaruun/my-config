vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '>-2<CR>gv=gv")

-- searching in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over text w/o copying replacing text
vim.keymap.set("x", "<leader>p", '"_dP')

-- replace current word in file
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- use jk to exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete selection without copying text
vim.keymap.set("v", "<leader>d", '"_d')

-- increment/decrement numbers
vim.keymap.set("n", "<leader>+", "<C-a>") -- increment
vim.keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- copy to clipboard (microsoft)
-- vim.cmd([[
-- if system('uname -r') =~ "microsoft"
--   augroup Yank
--   autocmd!
--   autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
--   augroup END
-- endif
-- ]])

-- window management
vim.keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
vim.keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
vim.keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- formatting
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
