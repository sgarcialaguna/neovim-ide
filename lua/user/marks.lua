local marks_ok, marks = pcall(require, "marks")
if not marks_ok then
	return
end

marks.setup({})
