local status_ok, leap = pcall(require, "leap")
if not status_ok then
	return
end
if vim.g.vscode then
	leap.opts.safe_labels = {}
end
leap.set_default_keymaps()
