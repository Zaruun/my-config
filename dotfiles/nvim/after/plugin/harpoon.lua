-- harpoon
vim.keymap.set("n", "<leader>hm", ':lua require("harpoon.ui").toggle_quick_menu()<CR>') -- harpoon toggle menu
vim.keymap.set("n", "<leader>ha", ':lua require("harpoon.mark").add_file()<CR>') -- harpoon add file
vim.keymap.set("n", "<leader>hn", ':lua require("harpoon.ui").nav_next()<CR>') -- harpoon go to next
vim.keymap.set("n", "<leader>hp", ':lua require("harpoon.ui").nav_prev()<CR>') -- harpoon go to prev
vim.keymap.set("n", "<leader>1", ':lua require("harpoon.ui").nav_file(1)<CR>') -- harpoon go to (1)
vim.keymap.set("n", "<leader>2", ':lua require("harpoon.ui").nav_file(2)<CR>') -- harpoon go to (2)
vim.keymap.set("n", "<leader>3", ':lua require("harpoon.ui").nav_file(3)<CR>') -- harpoon go to (3)
vim.keymap.set("n", "<leader>4", ':lua require("harpoon.ui").nav_file(4)<CR>') -- harpoon go to (4)
vim.keymap.set("n", "<leader>5", ':lua require("harpoon.ui").nav_file(5)<CR>') -- harpoon go to (5)
vim.keymap.set("n", "<leader>6", ':lua require("harpoon.ui").nav_file(6)<CR>') -- harpoon go to (6)
