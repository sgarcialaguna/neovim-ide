local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
local util = require("lspconfig.util")

lspconfig.tsserver.setup({
	root_dir = util.root_pattern(".git"),
})
