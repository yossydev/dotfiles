--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local protocol = require("vim.lsp.protocol")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	--local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	--buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "gi", '<cmd>lua vim.diagnostic.open_float({scope="line"})<CR>', opts)
	buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
end

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require("cmp_nvim_lsp").default_capabilities()

nvim_lsp.flow.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- TypeScript
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
	cmd = { "typescript-language-server", "--stdio" },
	capabilities = capabilities,
	single_file_support = false,
	root_dir = nvim_lsp.util.root_pattern("package.json"),
})

-- Deno
nvim_lsp.denols.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
	init_options = {
		lint = true,
		unstable = true,
		suggest = {
			imports = {
				hosts = {
					["https://deno.land"] = true,
					["https://cdn.nest.land"] = true,
					["https://crux.land"] = true,
				},
			},
		},
	},
	on_init = function(client)
		vim.notify("denols initialized for root directory: " .. client.config.root_dir, vim.log.levels.INFO)
	end,
})

nvim_lsp.sourcekit.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- TailwindCSS
nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- CSS
nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Astro
nvim_lsp.astro.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Go
nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Rust
nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Biome
nvim_lsp.biome.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- lua
nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- mdx
nvim_lsp.mdx_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

capabilities.offsetEncoding = { "utf-16" }
-- C++
nvim_lsp.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
