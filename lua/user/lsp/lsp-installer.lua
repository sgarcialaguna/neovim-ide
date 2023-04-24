local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end
local util = require("lspconfig.util")

local servers = {
	"lua_ls",
	"cssls",
	"html",
	"eslint",
	"tsserver",
	"pyright",
	"bashls",
	"jsonls",
	"yamlls",
	"terraformls",
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

local opts = {}

for _, server in pairs(servers) do
	opts = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	}

	if server == "tsserver" or server == "eslint" or server == "pyright" then
		opts.handlers = {
			["textDocument/publishDiagnostics"] = function() end,
		}
	end

	if server == "tsserver" then
		opts.root_dir = util.root_pattern("pyproject.toml")
	end

	lspconfig[server].setup(opts)
end
