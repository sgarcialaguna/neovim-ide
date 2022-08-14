local luasnip_ok, ls = pcall(require, "luasnip")
if not luasnip_ok then
	return
end
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,

	ext_opts = {
		[types.choiceNode] = {
			active = { virt_text = { { "<- Current Choice", "Error" } } },
		},
	},
})

local loader = require("luasnip.loaders.from_vscode")
loader.lazy_load({ paths = "./snippets/es7-react-js" })
loader.lazy_load({ paths = "./snippets/vscode-jest-snippets" })
loader.lazy_load({ paths = "./snippets/vscode-drf" })

ls.add_snippets("all", {
	s(
		"year",
		f(function()
			return os.date("%Y")
		end)
	),
})

local function importName(args)
	local parts = vim.split(args[1][1], ".", true)
	return parts[#parts] or ""
end

ls.add_snippets("lua", {
	-- local builtin = require "telescope.pickers.buitin"
	s(
		"req",
		fmt([[local {} = require ("{}")]], {
			f(importName, { 1 }),
			i(1),
		})
	),
	s(
		"safereq",
		fmt(
			[[ 
            local {}_ok, {} = pcall(require, "{}")
            if not {}_ok then
                return
            end
            {}
            ]],
			{ f(importName, { 1 }), f(importName, { 1 }), i(1), f(importName, { 1 }), i(0) }
		)
	),
	s(
		"keymap",
		fmt(
			[[
    vim.keymap.set("{}", "{}", "{}")
    {}
    ]],
			{ i(1), i(2), i(3), i(0) }
		)
	),
	s("snippet", fmt('s("{}", fmt([[{}]], {{{}}})),\n{}', { i(1), i(2), i(3), i(0) })),
	s("use", fmt('use({{ "{}/{}" , commit="{}" }} )\n{}', { i(1), i(2), i(3), i(0) })),
})

-- Quick reload
vim.keymap.set("n", "<leader><leader>r", "<cmd>source %<CR>")
