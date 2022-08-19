local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = true,
	always_visible = true,
}

local diff = {
	"diff",
	colored = true,
	cond = hide_in_width,
}

local filetype = {
	"filetype",
	icons_enabled = false,
}

local location = {
	"location",
	padding = 0,
}

local filename = {
	"filename",
	newfile_status = true,
	file_status = true,
	path = 2,
}

local spaces = function()
	return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end
