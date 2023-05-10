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
	"rhysd/clever-f.vim",
	{
		"gbprod/cutlass.nvim",
		config = {
			cut_key = "x",
			override_del = true,
			exclude = { "ns", "nS" },
		},
	},
	"svermeulen/vim-yoink",

	-- Colorschemes
	{
		"folke/tokyonight.nvim",
		enabled = not vim.g.vscode,
		config = function()
			vim.cmd([[colorscheme tokyonight]])
		end,
	},

	-- Treesitter
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		enabled = not vim.g.vscode,
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ -- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			--'hrsh7th/cmp-nvim-lsp-signature-help'
			"ray-x/lsp_signature.nvim",
		},
		enabled = not vim.g.vscode,
	},
})
