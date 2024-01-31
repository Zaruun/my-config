return {
    "ThePrimeagen/harpoon",
      dependencies = {
          "nvim-lua/plenary.nvim",
      },
      config = function()
          vim.keymap.set("n", "<leader>hm", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {})
          vim.keymap.set("n", "<leader>ha", ":lua require('harpoon.mark').add_file()<CR>", {})
          vim.keymap.set("n", "<leader>1", ":lua require('harpoon.ui').nav_file(1)<CR>", {})
          vim.keymap.set("n", "<leader>2", ":lua require('harpoon.ui').nav_file(2)<CR>", {})
          vim.keymap.set("n", "<leader>3", ":lua require('harpoon.ui').nav_file(3)<CR>", {})
          vim.keymap.set("n", "<leader>4", ":lua require('harpoon.ui').nav_file(4)<CR>", {})
      end,
  }