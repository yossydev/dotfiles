require("lspsaga").setup({
	ui = {
		winblend = 10,
		border = "rounded",
		colors = {
			normal_bg = "#002b36",
		},
	},
	symbol_in_winbar = {
		enable = false,
	},
})

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", opts)
vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
-- vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
-- vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set("i", "<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)

--[[
  [bug]not work rename: https://github.com/nvimdev/lspsaga.nvim/issues/1195
  vim.keymap.set("n", "gn", ":LspInfoLspsaga rename<CR>", opts)
--]]
vim.api.nvim_set_keymap("n", "gn", ":lua vim.lsp.buf.rename()<CR>", opts)
vim.keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "gr", "<cmd>Lspsaga finder<CR>", opts)
