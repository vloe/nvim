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

	-- color scheme
	use("marko-cerovac/material.nvim")

	-- lsp stuff
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-buffer")
	use("L3MON4D3/LuaSnip")
	use("jose-elias-alvarez/null-ls.nvim")
	use("neovim/nvim-lspconfig")

	-- other terminal window stuff
	use("akinsho/toggleterm.nvim")
	use("christoomey/vim-tmux-navigator")
	use("nvim-tree/nvim-tree.lua")

	-- git stuff
	use("zbirenbaum/copilot.lua")
	use("lewis6991/gitsigns.nvim")
	use({ "zbirenbaum/copilot-cmp", after = { "copilot.lua" } })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
