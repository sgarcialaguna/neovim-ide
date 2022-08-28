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
	use({ "wbthomason/packer.nvim", commit = "00ec5adef58c5ff9a07f11f45903b9dbbaa1b422" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "968a4b9afec0c633bc369662e78f8c5db0eba249" }) -- Useful lua functions used by lots of plugins
	use({ "tpope/vim-surround" })
	use({ "ggandor/leap.nvim", commit = "801884c7de8ffeb64adb700c8685aa98d67e64bb" })
	if not vim.g.vscode then
		use({ "windwp/nvim-autopairs", commit = "fa6876f832ea1b71801c4e481d8feca9a36215ec" }) -- Autopairs, integrates with both cmp and treesitter
		use({ "windwp/nvim-ts-autotag", commit = "044a05c4c51051326900a53ba98fddacd15fea22" }) -- Autopairs, integrates with both cmp and treesitter
		use({ "numToStr/Comment.nvim", commit = "2c26a00f32b190390b664e56e32fd5347613b9e2" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "88343753dbe81c227a1c1fd2c8d764afb8d36269" })
		use({ "kyazdani42/nvim-web-devicons", commit = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" })
		-- use({ "kyazdani42/nvim-tree.lua", commit = "bdb6d4a25410da35bbf7ce0dbdaa8d60432bc243" })
		use({ "ms-jpq/chadtree", commit = "2e2ad117d7fff7e4568b8ae7771f245203a08c04" })
		use("mattn/emmet-vim")

		use({ "akinsho/bufferline.nvim", commit = "c78b3ecf9539a719828bca82fc7ddb9b3ba0c353" })
		use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
		use({ "tiagovla/scope.nvim", commit = "2db6d31de8e3a98d2b41c0f0d1f5dc299ee76875" })
		use({ "nvim-lualine/lualine.nvim", commit = "3362b28f917acc37538b1047f187ff1b5645ecdd" })
		use({ "akinsho/toggleterm.nvim", commit = "aaeed9e02167c5e8f00f25156895a6fd95403af8" })
		use({ "ahmedkhalf/project.nvim", commit = "541115e762764bc44d7d3bf501b6e367842d3d4f" })
		use({ "lewis6991/impatient.nvim", commit = "969f2c5c90457612c09cf2a13fee1adaa986d350" })
		use({ "lukas-reineke/indent-blankline.nvim", commit = "6177a59552e35dfb69e1493fd68194e673dc3ee2" })
		use({ "goolord/alpha-nvim", commit = "ef27a59e5b4d7b1c2fe1950da3fe5b1c5f3b4c94" })

		use("tpope/vim-repeat")
		use({ "folke/which-key.nvim", commit = "bd4411a2ed4dd8bb69c125e339d837028a6eea71" })
		use({
			"jedrzejboczar/toggletasks.nvim",
			commit = "4329ad580799f25c0a923a2d1e71a585ae0bbc48",
			config = {
				function()
					require("toggletasks").setup({
						defaults = { close_on_exit = false },
						telescope = { spawn = { show_running = true } },
					})
				end,
			},
		})
		use("stevearc/stickybuf.nvim")
		use("vim-test/vim-test")

		use({ "stevearc/dressing.nvim", commit = "d886a1bb0b43a81af58e0331fedbe8b02ac414fa" })
		use({ "rcarriga/nvim-notify", commit = "60bb6bfd6992549ee5336bbb761705b62797ce1d" })
		use({ "ten3roberts/qf.nvim", commit = "6c60d175ecb1fe5e7f1dd71e8ade848d1d9d989b" })
		use({ "chentoast/marks.nvim", commit = "b27cbb78e9082229590b396d3ae4fe07f1aeafe0" })

		-- Colorschemes
		use({ "EdenEast/nightfox.nvim", tag = "e2f961859cbfb2ba38147dc59fdd2314992c8b62" })

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

		-- Git
		use({ "lewis6991/gitsigns.nvim", commit = "c18e016864c92ecf9775abea1baaa161c28082c3" })
		use({ "tpope/vim-fugitive", tag = "v3.7" })

		-- DAP
		use({ "mfussenegger/nvim-dap", commit = "014ebd53612cfd42ac8c131e6cec7c194572f21d" })
		use({ "rcarriga/nvim-dap-ui", commit = "d76d6594374fb54abf2d94d6a320f3fd6e9bb2f7" })
		use({ "mfussenegger/nvim-dap-python", commit = "86d263609c7253a6043b07e695f565ed8e34fcbf" })
	end

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
