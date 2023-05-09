require("user.options")
require("user.keymaps")
require("user.plugins")
require("user.autocommands")
require("user.leap")
if not vim.g.vscode then
    require("user.lsp")
end

