local diaglist_ok, diaglist = pcall(require, "diaglist")
if not diaglist_ok then
	return
end

diaglist.init()
