require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.leap")
require("user.autocommands")
if not vim.g.vscode then
	require("user.notify")
	require("user.colorscheme")
	require("user.cmp")
	require("user.telescope")
	require("user.treesitter")
	require("user.autopairs")
	require("user.comment")
	require("user.gitsigns")
	require("user.chadtree")
	require("user.bufferline")
	require("user.scope")
	require("user.lualine")
	require("user.toggleterm")
	require("user.project")
	require("user.impatient")
	require("user.indentline")
	require("user.alpha")
	require("user.lsp")
	require("user.which-key")
	require("user.signature")
	require("user.snippets")
	require("user.quickfix")
	require("user.trouble")
	require("user.marks")
	require("user.test")
end
