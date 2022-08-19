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

vim.g["test#strategy"] = "tterm"
vim.g["test#javascript#reactscripts#executable"] = "yarn react-scripts test"
vim.g["test#javascript#jest#executable"] = "yarn react-scripts test"

vim.cmd([[
function JestTransform(cmd) abort
    return substitute(a:cmd, "\\", "/", "g")
endfunction
]])

vim.cmd("let g:test#custom_transformations = {'jest': function('JestTransform')}")
vim.cmd("let g:test#transformation = 'jest'")
