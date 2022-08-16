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

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "truncate" },
		file_ignore_patterns = { ".git/", "node_modules" },
		vimgrep_arguments = vimgrep_arguments,
		show_hidden = true,

		mappings = {
			i = {
				["<Esc>"] = actions.close,
				["<Up>"] = actions.cycle_history_prev,
				["<Down>"] = actions.cycle_history_next,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<c-t>"] = trouble.open_with_trouble,
			},
			n = { ["<c-t>"] = trouble.open_with_trouble },
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		},
	},
})
vim.cmd("autocmd User TelescopePreviewerLoaded setlocal wrap")

telescope.load_extension("fzf")
telescope.load_extension("toggletasks")
telescope.load_extension("live_grep_args")
