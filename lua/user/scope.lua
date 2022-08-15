local scope_ok, scope = pcall(require, "scope")
if not scope_ok then
	return
end

scope.setup()
