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
telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "relative" },
		file_ignore_patterns = { ".git/", "node_modules" },
		vimgrep_arguments = vimgrep_arguments,

		mappings = {
			i = {
				["<Esc>"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
		},
	},
})

telescope.load_extension("fzf")
telescope.load_extension("toggletasks")

local M = {}

M.project_files = function()
	local opts = {} -- define here if you want to define something
	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		require("telescope.builtin").find_files(opts)
	end
end

return M
