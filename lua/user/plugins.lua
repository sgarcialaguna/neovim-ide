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

		-- cmp plugins
		use({ "hrsh7th/nvim-cmp", commit = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }) -- The completion plugin
		use({ "hrsh7th/cmp-buffer", commit = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- buffer completions
		use({ "hrsh7th/cmp-path", commit = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- path completions
		use({ "saadparwaiz1/cmp_luasnip", commit = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- snippet completions
		use({ "hrsh7th/cmp-nvim-lsp", commit = "affe808a5c56b71630f17aa7c38e15c59fd648a8" })
		use({ "hrsh7th/cmp-nvim-lua", commit = "d276254e7198ab7d00f117e88e223b4bd8c02d21" })

		-- snippets
		use({ "L3MON4D3/LuaSnip", commit = "79b2019c68a2ff5ae4d732d50746c901dd45603a" }) --snippet engine
		use({ "rafamadriz/friendly-snippets", commit = "7339def34e46237eb7c9a893cb7d42dcb90e05e6" })

		-- LSP
		use({ "neovim/nvim-lspconfig", commit = "148c99bd09b44cf3605151a06869f6b4d4c24455" }) -- enable LSP
		use({ "williamboman/nvim-lsp-installer", commit = "e9f13d7acaa60aff91c58b923002228668c8c9e6" }) -- simple to use language server installer
		use({ "jose-elias-alvarez/null-ls.nvim", commit = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- for formatters and linters
		use({ "ray-x/lsp_signature.nvim", commit = "4665921ff8e30601c7c1328625b3abc1427a6143" })
		use({ "onsails/lspkind.nvim", commit = "57e5b5dfbe991151b07d272a06e365a77cc3d0e7" })
		use({ "folke/trouble.nvim", commit = "da61737d860ddc12f78e638152834487eabf0ee5" })

		-- Telescope
		use({ "nvim-telescope/telescope.nvim", commit = "8746347ac4065f5795e7bd33c7912ab1152cca4b" })
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			commit = "6a33ecefa9b3d9ade654f9a7a6396a00c3758ca6",
			run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		})
		use({ "nvim-telescope/telescope-live-grep-args.nvim" })

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			commit = "518e27589c0463af15463c9d675c65e464efc2fe",
		})
		use({ "p00f/nvim-ts-rainbow", commit = "1e904f6d1b41adb9d3b87df2108dc4a315a72379" })
		use({ "nvim-treesitter/nvim-treesitter-context", commit = "8e88b67d0dc386d6ba1b3d09c206f19a50bc0625" })

		-- Git
		use({ "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" })
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
