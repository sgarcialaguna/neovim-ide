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

-- Clear highlights
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", opts)

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

-- Common mistake
vim.cmd("cnoreabbrev W w")
vim.cmd("cnoreabbrev Wq wq")

-- Save with C-s
keymap({ "i", "n" }, "<C-s>", "<cmd>:w<cr>", opts)

if vim.g.vscode then
	keymap({ "x", "n", "o" }, "gc", "<Plug>VSCodeCommentary", opts)
	keymap("n", "gcc", "<Plug>VSCodeCommentaryLine", opts)

	vim.keymap.set("n", "<leader>gg", "<cmd>call VSCodeNotify('workbench.view.scm')<CR>")
	vim.keymap.set("n", "<leader>gj", "<cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>")
	vim.keymap.set("n", "<leader>gk", "<cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>")
	vim.keymap.set("n", "<leader>gr", "<cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>")
	vim.keymap.set("n", "<leader>gR", "<cmd>call VSCodeNotify('workbench.action.files.revert')<CR>")
	vim.keymap.set("n", "<leader>gd", "<cmd>call VSCodeNotify('gitlens.diffLineWithWorking')<CR>")
	vim.keymap.set("n", "<leader>e", "<cmd>call VSCodeNotify('workbench.view.explorer')<CR>")

	vim.keymap.set("n", "<leader>xx", "<cmd>call VSCodeNotify('workbench.actions.view.problem')<CR>")
end

-- Yoink
vim.keymap.set("n", "<A-n>", "<Plug>(YoinkPostPasteSwapBack)")
vim.keymap.set("n", "<A-p>", "<Plug>(YoinkPostPasteSwapForward)")
vim.keymap.set("n", "p", "<Plug>(YoinkPaste_p)")
vim.keymap.set("n", "P", "<Plug>(YoinkPaste_P)")
vim.keymap.set("n", "gp", "<Plug>(YoinkPaste_gp)")
vim.keymap.set("n", "gP", "<Plug>(YoinkPaste_gP)")
vim.keymap.set({ "n", "x" }, "y", "<Plug>(YoinkYankPreserveCursorPosition)")
