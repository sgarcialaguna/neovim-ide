local tt = require("toggleterm")
local ttt = require("toggleterm.terminal")

vim.g["test#custom_strategies"] = {
	tterm = function(cmd)
		tt.exec(cmd)
	end,

	tterm_close = function(cmd)
		local term_id = 0
		tt.exec(cmd, term_id)
		ttt.get_or_create_term(term_id):close()
	end,
}

-- vim.g["test#strategy"] = "tterm"
vim.g["test#python#runner"] = "djangotest"
vim.g["test#python#djangotest#file_pattern"] = "\\vtest.*(\\.py)$"
vim.g["test#python#djangotest#executable"] =
	'$env:DJANGO_SETTINGS_MODULE="drg.settings_test"; dotenv -f "../../Sources/Scripts/deployment/ansible/files/env/drg.env" run poetry run python manage.py test'
vim.g["test#project_root"] = "./Sources/Web"
vim.g["test#javascript#reactscripts#executable"] = "yarn react-scripts test"
vim.g["test#javascript#jest#executable"] = "yarn test"

vim.cmd([[
function JestTransform(cmd) abort
    return substitute(a:cmd, "\\", "/", "g")
endfunction
]])

vim.cmd("let g:test#custom_transformations = {'jest': function('JestTransform')}")
vim.cmd("let g:test#transformation = 'jest'")
