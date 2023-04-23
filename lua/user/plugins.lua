local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--depth=1",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install your plugins here
lazy.setup({
	-- My plugins here
	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"tpope/vim-surround",
	"tpope/vim-repeat",
	"ggandor/leap.nvim",
	"tpope/vim-fugitive",
	"tpope/vim-abolish",

	{ "windwp/nvim-autopairs", enabled = not vim.g.vscode }, -- Autopairs, integrates with both cmp and treesitter
	{ "windwp/nvim-ts-autotag", enabled = not vim.g.vscode }, -- Autopairs, integrates with both cmp and treesitter
	{ "numToStr/Comment.nvim", enabled = not vim.g.vscode },
	{ "JoosepAlviste/nvim-ts-context-commentstring", enabled = not vim.g.vscode },
	{
		"nvim-neo-tree/neo-tree.nvim",
		enabled = not vim.g.vscode,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
		config = true,
	},
	{ "mattn/emmet-vim", enabled = not vim.g.vscode },

	{ "akinsho/bufferline.nvim", enabled = not vim.g.vscode },
	{ "moll/vim-bbye", enabled = not vim.g.vscode },
	{ "tiagovla/scope.nvim", enabled = not vim.g.vscode },
	{ "nvim-lualine/lualine.nvim", enabled = not vim.g.vscode },
	{ "akinsho/toggleterm.nvim", enabled = not vim.g.vscode },
	{ "ahmedkhalf/project.nvim", enabled = not vim.g.vscode },
	{ "lukas-reineke/indent-blankline.nvim", enabled = not vim.g.vscode },
	{ "goolord/alpha-nvim", enabled = not vim.g.vscode },

	{ "folke/which-key.nvim", enabled = not vim.g.vscode },
	{
		"jedrzejboczar/toggletasks.nvim",
		config = {
			function()
				require("toggletasks").setup({
					defaults = { close_on_exit = false },
					telescope = { spawn = { show_running = true } },
				})
			end,
		},
	},
	{ "stevearc/stickybuf.nvim", enabled = not vim.g.vscode },
	{ "vim-test/vim-test", enabled = not vim.g.vscode },

	{ "stevearc/dressing.nvim", enabled = not vim.g.vscode },
	{ "rcarriga/nvim-notify", enabled = not vim.g.vscode },
	{ "ten3roberts/qf.nvim", enabled = not vim.g.vscode },
	{ "chentoast/marks.nvim", enabled = not vim.g.vscode },

	-- Colorschemes
	{ "EdenEast/nightfox.nvim", enabled = not vim.g.vscode },
	{ "LunarVim/onedarker.nvim", enabled = not vim.g.vscode },

	-- cmp plugins
	{ "hrsh7th/nvim-cmp", enabled = not vim.g.vscode }, -- The completion plugin
	{ "hrsh7th/cmp-buffer", enabled = not vim.g.vscode }, -- buffer completions
	{ "hrsh7th/cmp-path", enabled = not vim.g.vscode }, -- path completions
	{ "saadparwaiz1/cmp_luasnip", enabled = not vim.g.vscode }, -- snippet completions
	{ "hrsh7th/cmp-nvim-lsp", enabled = not vim.g.vscode },
	{ "hrsh7th/cmp-nvim-lua", enabled = not vim.g.vscode },

	-- snippets
	{ "folke/tokyonight.nvim", enabled = not vim.g.vscode },

	-- LSP
	{ "neovim/nvim-lspconfig", enabled = not vim.g.vscode }, -- enable LSP
	{ "williamboman/nvim-lsp-installer", enabled = not vim.g.vscode }, -- simple to use language server installer
	{ "jose-elias-alvarez/null-ls.nvim", enabled = not vim.g.vscode }, -- for formatters and linters
	{ "ray-x/lsp_signature.nvim", enabled = not vim.g.vscode },
	{ "onsails/lspkind.nvim", enabled = not vim.g.vscode },

	{ "folke/trouble.nvim", enabled = not vim.g.vscode },

	-- Telescope
	{ "nvim-telescope/telescope.nvim", enabled = not vim.g.vscode },
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
		enabled = not vim.g.vscode,
	},
	{ "nvim-telescope/telescope-live-grep-args.nvim", enabled = not vim.g.vscode },

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", enabled = not vim.g.vscode },
	{ "p00f/nvim-ts-rainbow", enabled = not vim.g.vscode },
	{ "nvim-treesitter/nvim-treesitter-context", enabled = not vim.g.vscode },

	-- Git
	{ "lewis6991/gitsigns.nvim", enabled = not vim.g.vscode },
})
