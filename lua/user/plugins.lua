local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use({ "wbthomason/packer.nvim", commit = "6afb67460283f0e990d35d229fd38fdc04063e0a" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "4b7e52044bbb84242158d977a50c4cbcd85070c7" }) -- Useful lua functions used by lots of plugins
	use({ "tpope/vim-surround", commit = "3d188ed2113431cf8dac77be61b842acb64433d9" })
	use({ "tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a" })
	use({ "ggandor/leap.nvim", commit = "c19e974cfd9d52dc5070ec7b68183da39702c877" })
	use({ "tpope/vim-fugitive", commit = "01f3e0af928857128eec8d998948b80ed1678c18" })
	use({ "tpope/vim-abolish", commit = "3f0c8faadf0c5b68bcf40785c1c42e3731bfa522" })
	if not vim.g.vscode then
		use({ "windwp/nvim-autopairs", commit = "6b6e35fc9aca1030a74cc022220bc22ea6c5daf4" }) -- Autopairs, integrates with both cmp and treesitter
		use({ "windwp/nvim-ts-autotag", commit = "fdefe46c6807441460f11f11a167a2baf8e4534b" }) -- Autopairs, integrates with both cmp and treesitter
		use({ "numToStr/Comment.nvim", commit = "ad7ffa8ed2279f1c8a90212c7d3851f9b783a3d6" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "32d9627123321db65a4f158b72b757bcaef1a3f4" })
		use({ "kyazdani42/nvim-web-devicons", commit = "520776f30a3b39ed56402bffbdae57549e778b40" })
		-- use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
		use({ "ms-jpq/chadtree", commit = "2e2ad117d7fff7e4568b8ae7771f245203a08c04" })
		use({ "mattn/emmet-vim", commit = "def5d57a1ae5afb1b96ebe83c4652d1c03640f4d" })

		use({ "akinsho/bufferline.nvim", commit = "7c07dee2714778a84a9adda6e676c8e2151085f2" })
		use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
		use({ "tiagovla/scope.nvim", commit = "2db6d31de8e3a98d2b41c0f0d1f5dc299ee76875" })
		use({ "nvim-lualine/lualine.nvim", commit = "3325d5d43a7a2bc9baeef2b7e58e1d915278beaf" })
		use({ "akinsho/toggleterm.nvim", commit = "3ba683827c623affb4d9aa518e97b34db2623093" })
		use({ "ahmedkhalf/project.nvim", commit = "685bc8e3890d2feb07ccf919522c97f7d33b94e4" })
		use({ "lewis6991/impatient.nvim", commit = "b842e16ecc1a700f62adb9802f8355b99b52a5a6" })
		use({ "lukas-reineke/indent-blankline.nvim", commit = "db7cbcb40cc00fc5d6074d7569fb37197705e7f6" })
		use({ "goolord/alpha-nvim", commit = "0bb6fc0646bcd1cdb4639737a1cee8d6e08bcc31" })

		use({ "folke/which-key.nvim", commit = "61553aeb3d5ca8c11eea8be6eadf478062982ac9" })
		use({
			"jedrzejboczar/toggletasks.nvim",
			commit = "b22c85f8a5d93a85196e0e46126f3af972832f7a",
			config = {
				function()
					require("toggletasks").setup({
						defaults = { close_on_exit = false },
						telescope = { spawn = { show_running = true } },
					})
				end,
			},
		})
		use({ "stevearc/stickybuf.nvim", commit = "cde97217a7e81ea4488e0c32b8ae6c9d181156c8" })
		use({ "vim-test/vim-test", commit = "ab7feab8cb139e5b4955cb4c6ddf52e968cb24be" })

		use({ "stevearc/dressing.nvim", commit = "8c1500069cafc9cfd93bf5521b17fde060008022" })
		use({ "rcarriga/nvim-notify", commit = "43c54aec682854b39a7e0e89b4c3ba00426d74a8" })
		use({ "ten3roberts/qf.nvim", commit = "63deb0ecd16f57543e551c5e3d0725e938ad6fe7" })
		use({ "chentoast/marks.nvim", commit = "b27cbb78e9082229590b396d3ae4fe07f1aeafe0" })

		-- Colorschemes
		use({ "EdenEast/nightfox.nvim", commit = "e2f961859cbfb2ba38147dc59fdd2314992c8b62" })
		use({ "LunarVim/onedarker.nvim" })

		-- cmp plugins
		use({ "hrsh7th/nvim-cmp", commit = "c37ea78941b93ef6b6bdd8274649ea8a0ce4f87a" }) -- The completion plugin
		use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
		use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
		use({ "saadparwaiz1/cmp_luasnip", commit = "18095520391186d634a0045dacaa346291096566" }) -- snippet completions
		use({ "hrsh7th/cmp-nvim-lsp", commit = "78924d1d677b29b3d1fe429864185341724ee5a2" })
		use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

		-- snippets
		use({ "L3MON4D3/LuaSnip", commit = "619796e2477f7233e5fdff456240676a08482684" }) --snippet engine
		use({ "rafamadriz/friendly-snippets", commit = "c93311fbcc840210a2c0db574177d84a35a2c9c1" })

		-- LSP
		use({ "neovim/nvim-lspconfig", commit = "c96ec574eacfff8ad8dd4bdb6e96a1b3dbd268fd" }) -- enable LSP
		use({ "williamboman/nvim-lsp-installer", commit = "23820a878a5c2415bfd3b971d1fe3c79e4dd6763" }) -- simple to use language server installer
		use({ "jose-elias-alvarez/null-ls.nvim", commit = "07d4ed4c6b561914aafd787453a685598bec510f" }) -- for formatters and linters
		use({ "ray-x/lsp_signature.nvim", commit = "7a1845e8b5fc68dc5ea2a1a7d2d2b04395b6b190" })
		use({ "onsails/lspkind.nvim", commit = "c68b3a003483cf382428a43035079f78474cd11e" })

		use({ "folke/trouble.nvim", commit = "ed65f84abc4a1e5d8f368d7e02601fc0357ea15e" })

		-- Telescope
		use({ "nvim-telescope/telescope.nvim", commit = "7a4ffef931769c3fe7544214ed7ffde5852653f6" })
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			commit = "65c0ee3d4bb9cb696e262bca1ea5e9af3938fc90",
			run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		})
		use({ "nvim-telescope/telescope-live-grep-args.nvim", commit = "7de3baef1ec4fb77f7a8195fe87bebd513244b6a" })

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			commit = "47bda4171aad2ee990a35ddb6319ceedc4d78b5d",
		})
		use({ "p00f/nvim-ts-rainbow", commit = "064fd6c0a15fae7f876c2c6dd4524ca3fad96750" })
		use({ "nvim-treesitter/nvim-treesitter-context", commit = "0dd5eae6dbf226107da2c2041ffbb695d9e267c1" })

		-- Git
		use({ "lewis6991/gitsigns.nvim", commit = "9ff7dfb051e5104088ff80556203634fc8f8546d" })
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
