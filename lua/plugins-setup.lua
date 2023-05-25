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
	print("packer not installed")
	return
end

return packer.startup(function(use)
	-- basics
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- bufferline
	use("akinsho/bufferline.nvim")
	use("famiu/bufdelete.nvim")

	-- colorscheme
	use("rebelot/kanagawa.nvim")

	-- lsp
	use("jose-elias-alvarez/null-ls.nvim")
	use("neovim/nvim-lspconfig")

	-- cmp
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-nvim-lua")
	use("zbirenbaum/copilot.lua")
	use("zbirenbaum/copilot-cmp")
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- other window things
	use("akinsho/toggleterm.nvim")
	use("christoomey/vim-tmux-navigator")
	use("nvim-tree/nvim-tree.lua")

	-- git
	use("lewis6991/gitsigns.nvim")

	-- autoclose
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")

	-- indentline
	use("lukas-reineke/indent-blankline.nvim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
