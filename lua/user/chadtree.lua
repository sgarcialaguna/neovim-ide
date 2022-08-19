local status_ok, chadtree = pcall(require, "chadtree")
if not status_ok then
	return
end

local chadtree_settings = {
	-- ["view.open_direction"] = "right",
	["theme.text_colour_set"] = "nord",
}
vim.api.nvim_set_var("chadtree_settings", chadtree_settings)
