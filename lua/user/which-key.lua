local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
	return
end

whichkey.register({
	c = {
		o = { "<cmd>lua require'qf'.open('c')<CR>", "Open quickfix list" },
		c = { "<cmd>lua require'qf'.close('c')<CR>", "Close quickfix list" },
		J = { "<cmd>cnfile<CR>", "Next file" },
		j = { "<cmd>cnext<CR>", "Next entry" },
		k = { "<cmd>cprev<CR>", "Previous entry" },
		K = { "<cmd>cpfile<CR>", "Previous file" },
		t = { "<cmd>lua require'qf'.toggle('c', true)<CR>", "Toggle quickfix list" },
	},
	d = {
		["0"] = { "<cmd>lua require'diaglist'.open_buffer_diagnostics()<cr>", "Open buffer diagnostics" },
		["1"] = { "<cmd>lua require'diaglist'.open_all_diagnostics()<cr>", "Open all diagnostics" },
	},
	l = {
		o = { "<cmd>lua require'qf'.open('l')<CR>", "Open location list" },
		c = { "<cmd>lua require'qf'.close('l')<CR>", "Close location list" },
		t = { "<cmd>lua require'qf'.toggle('l', true)<CR>", "Toggle location list" },
	},
	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},
}, { prefix = "<leader>" })
