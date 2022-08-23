local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local fzf_opts = {
	fuzzy = true, -- false will only do exact matching
	override_generic_sorter = true, -- override the generic sorter
	override_file_sorter = true, -- override the file sorter
	case_mode = "smart_case", -- or "ignore_case" or "respect_case"
	-- the default case_mode is "smart_case"
}

telescope.setup({
	defaults = {
		path_display = { "truncate" },
		file_ignore_patterns = { ".git/", "node_modules" },
		vimgrep_arguments = vimgrep_arguments,
		show_hidden = true,

		mappings = {
			i = {
				["<Esc>"] = actions.close,
				["<C-Up>"] = actions.cycle_history_prev,
				["<C-Down>"] = actions.cycle_history_next,
				["Up"] = actions.move_selection_next,
				["Down"] = actions.move_selection_previous,
				["<c-t>"] = trouble.open_with_trouble,
				["<c-f>"] = actions.to_fuzzy_refine,
			},
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
	pickers = {
		-- Manually set sorter, for some reason not picked up automatically
		lsp_dynamic_workspace_symbols = {
			sorter = telescope.extensions.fzf.native_fzf_sorter(fzf_opts),
		},
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		},
	},
	extensions = {
		fzf = fzf_opts,
	},
})
vim.cmd("autocmd User TelescopePreviewerLoaded setlocal wrap")

telescope.load_extension("fzf")
telescope.load_extension("live_grep_args")
telescope.load_extension("toggletasks")
