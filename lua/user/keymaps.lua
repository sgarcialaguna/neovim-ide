-- Shorten function name
local keymap = vim.keymap.set
-- Silent keymap option
local opts = { silent = true }

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
if not vim.g.vscode then
	keymap("n", "<C-h>", "<C-w>h", opts)
	keymap("n", "<C-j>", "<C-w>j", opts)
	keymap("n", "<C-k>", "<C-w>k", opts)
	keymap("n", "<C-l>", "<C-w>l", opts)
	keymap("n", "<C-t>", "<C-w>T", opts)

	-- Resize with arrows
	keymap("n", "<C-Up>", ":resize -2<CR>", opts)
	keymap("n", "<C-Down>", ":resize +2<CR>", opts)
	keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
	keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

	-- Navigate buffers
	keymap("n", "<leader>bj", ":bnext<CR>", opts)
	keymap("n", "<leader>bk", ":bprevious<CR>", opts)
	keymap("n", "<leader>bp", ":BufferLineTogglePin<CR>", opts)
	keymap("n", "<leader>bb", ":BufferLinePick<CR>", opts)
end

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

-- Close buffers
keymap("n", "<leader>q", "<cmd>Bdelete!<CR>", opts)
-- Close other buffers
keymap("n", "<leader>o", ":%bd|e#|bd#<CR>", opts)

-- Better paste
--[[ keymap({ "v", "x" }, "p", '"_dP', opts) ]]

-- Insert --
-- Press jk fast to exit
--[[ keymap("i", "jk", "<ESC>l", opts) ]]

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)
keymap("v", ".", ":norm .<CR>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
-- Plugins --

-- ChadTree
if not vim.g.vscode then
	keymap("n", "<leader>e", ":Neotree toggle<CR>")

	-- Telescope
	keymap("n", "<leader>fb", ":Telescope git_branches<CR>", opts)
	keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)
	keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
	keymap("n", "<C-F>", ":Telescope live_grep_args<CR>", opts)
	keymap("n", "<leader>fg", ":Telescope live_grep_args<CR>", opts)
	keymap("n", "<leader>fo", ":Telescope buffers<CR>", opts)
	keymap("n", "<leader>fs", ":Telescope lsp_dynamic_workspace_symbols <CR>", opts)
	keymap("n", "<leader>fp", ":Telescope projects<CR>", opts)

	-- Git
	keymap("n", "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", opts)

	-- Comment
	keymap("n", "<leader>/", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
	keymap("x", "<leader>/", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>')

	-- Trouble
	keymap("n", "<leader>tx", "<cmd>TroubleToggle<cr>", opts)
	keymap("n", "<leader>tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
	keymap("n", "<leader>td", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
	keymap("n", "<leader>tl", "<cmd>TroubleToggle loclist<cr>", opts)
	keymap("n", "<leader>tq", "<cmd>TroubleToggle quickfix<cr>", opts)
	keymap("n", "<leader>tj", "<cmd>lua require('trouble').next({skip_groups = true, jump = true});<cr>", opts)
	keymap("n", "<leader>tk", "<cmd>lua require('trouble').previous({skip_groups = true, jump = true});<cr>", opts)
	keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

	keymap("n", "<C-F5>", "<cmd>Telescope toggletasks spawn<cr>", opts)
	keymap("n", "<S-F5>", "<cmd>Telescope toggletasks select<cr>", opts)
end

-- Common mistake
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Wq wq")

-- Vim Regexes are duuuuuuummmmmmbbbbb.
vim.cmd([[
nnoremap / /\v
vnoremap / /\v
" cnoremap \>s/ \>smagic/
" cnoremap %s/ %smagic/
]])

-- Save with C-s
keymap({ "i", "n" }, "<C-s>", "<cmd>:w<cr>", opts)

if vim.g.vscode then
	keymap({ "x", "n", "o" }, "gc", "<Plug>VSCodeCommentary", opts)
	keymap("n", "gcc", "<Plug>VSCodeCommentaryLine", opts)

	vim.keymap.set("n", "<leader>gg", "<cmd>call VSCodeNotify('workbench.view.scm')<CR>")
	vim.keymap.set("n", "<leader>gj", "<cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>")
	vim.keymap.set("n", "<leader>gk", "<cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>")
	vim.keymap.set("n", "<leader>gr", "<cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>")
	vim.keymap.set("n", "<leader>gd", "<cmd>call VSCodeNotify('gitlens.diffLineWithWorking')<CR>")

	vim.keymap.set("n", "<leader>xx", "<cmd>call VSCodeNotify('workbench.actions.view.problem')<CR>")
end
