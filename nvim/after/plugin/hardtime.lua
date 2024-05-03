local status, hardtime = pcall(require, "hardtime")
if not status then
	return
end

hardtime.setup({
	max_count = 1000,
})
