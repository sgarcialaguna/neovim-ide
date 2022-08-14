local qf_ok, qf = pcall(require, "qf")
if not qf_ok then
	return
end

qf.setup({
	pretty = true,
})
