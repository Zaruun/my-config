local lsp_servers = { "lua_ls", "html", "tailwindcss", "tsserver", "astro" }
local formatters = { "stylua", "jq", "prettier" }
return {
	{
		{
			"williamboman/mason.nvim",
			lazy = false,
			config = function()
				require("mason").setup()
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			lazy = false,
			opts = {
				ensure_installed = lsp_servers,
				auto_install = true,
			},
		},
		{
			"jay-babu/mason-null-ls.nvim",
			lazy = false,
			opts = {
				ensure_installed = formatters,
			},
		},
		{
			"neovim/nvim-lspconfig",
			lazy = false,
			config = function()
				local capabilities = require("cmp_nvim_lsp").default_capabilities()

				local lspconfig = require("lspconfig")

				for _, server in ipairs(lsp_servers) do
					lspconfig[server].setup({
						capabilities = capabilities,
					})
				end

				vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
				vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
				vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
				vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, {})
				vim.keymap.set("n", "<leader>gl", vim.diagnostic.open_float, {})
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			end,
		},
	},
}
