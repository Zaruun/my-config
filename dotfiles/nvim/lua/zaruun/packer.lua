-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

-- add list of plugins to install
return packer.startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

  -- Telescope
	use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Colors
	use('bluz71/vim-nightfly-guicolors')
	use('tomasr/molokai')
	use('ghifarit53/tokyonight-vim')

  -- Treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  -- Harpoon
	use('theprimeagen/harpoon')

  -- Vim-surround - add, delete, change surroundings
  use('tpope/vim-surround')

  -- Comment with gc
  use('numToStr/Comment.nvim')

  -- statusline
	use('nvim-lualine/lualine.nvim')

  -- Indent-blankline
  use('lukas-reineke/indent-blankline.nvim')

  -- git integration - show line modifications on left hand side
	use('lewis6991/gitsigns.nvim')

  -- toggleterm
  use('akinsho/toggleterm.nvim')
  
  -- vim-css-color
  use('norcalli/nvim-colorizer.lua')

  -- vs-code like icons
	use('kyazdani42/nvim-web-devicons')

  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	if packer_bootstrap then
		require("packer").sync()
	end
end)
