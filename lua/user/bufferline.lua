local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		middle_mouse_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
		right_mouse_command = "vertical sbuffer %d",
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
	},
})
