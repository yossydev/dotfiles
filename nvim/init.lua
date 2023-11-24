require("base")
require("highlight")
require("maps")
require("plugins")

local has = function(x)
  return vim.fn.has(x) == 1
end

local is_mac = has "macunix"
local is_win = has "win32"

vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)
vim.g.rustfmt_autosave = 1

if is_mac then
  require('macos')
end
if is_win then
  require('windows')
end
