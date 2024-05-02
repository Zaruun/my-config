if vim.g.vscode then
    -- VSCode extension
    vim.g.mapleader = " "
    
    vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>")
    
    vim.keymap.set("n", "<C-d>", ":lua require('vscode-neovim').call('cursorPageDown')<CR>")
    vim.keymap.set("n", "<C-u>", ":lua require('vscode-neovim').call('cursorPageUp')<CR>")
    vim.keymap.set("n", "n", "nzzzv")
    vim.keymap.set("n", "N", "Nzzzv")
    
    vim.opt.clipboard = "unnamedplus"
    
    -- greatest remap ever
    vim.keymap.set("x", "<leader>p", [["_dP]])
    vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
    vim.keymap.set("n", "<Leader>dw", [[:normal! viw"_d<CR>]])
    
    -- better indenting
    vim.keymap.set("v", "<", "<gv")
    vim.keymap.set("v", ">", ">gv")

    vim.keymap.set("n", "<leader>v", ":lua require('vscode-neovim').call('workbench.action.splitEditor')<CR>")
    -- vim.keymap.set("n", "<leader>h", ":lua require('vscode-neovim').call('workbench.action.focusFirstEditorGroup')<CR>")
    -- vim.keymap.set("n", "<leader>l", ":lua require('vscode-neovim').call('workbench.action.focusLastEditorGroup')<CR>")
    vim.keymap.set("n", "<C-h>", ":lua require('vscode-neovim').call('workbench.action.navigateLeft')<CR>")
    vim.keymap.set("n", "<C-l>", ":lua require('vscode-neovim').call('workbench.action.navigateRight')<CR>")

    vim.keymap.set("n", "<leader>1", ":lua require('vscode-neovim').call('workbench.action.openEditorAtIndex1')<CR>")
    vim.keymap.set("n", "<leader>2", ":lua require('vscode-neovim').call('workbench.action.openEditorAtIndex2')<CR>")
    vim.keymap.set("n", "<leader>3", ":lua require('vscode-neovim').call('workbench.action.openEditorAtIndex3')<CR>")
    vim.keymap.set("n", "<leader>4", ":lua require('vscode-neovim').call('workbench.action.openEditorAtIndex4')<CR>")
else
    -- ordinary Neovim
end