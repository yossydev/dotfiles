local status, null_ls = pcall(require, "null-ls")
if not status then
	return
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local function lsp_formatting(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

local function file_exists(file)
	local f = io.open(file, "r")
	if f then
		f:close()
		return true
	end
	return false
end

-- 共通のon_attach関数
local function on_attach(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

local function setup_null_ls(sources)
	null_ls.setup({
		sources = sources,
		on_attach = on_attach,
	})
end

local use_deno = vim.fn.filereadable("deno.json") == 1

local sources = {
	null_ls.builtins.formatting.prettierd,
	null_ls.builtins.diagnostics.fish,
	null_ls.builtins.formatting.stylua,
	null_ls.builtins.formatting.clang_format,
	null_ls.builtins.formatting.biome,
	null_ls.builtins.diagnostics.fish,
}

local function eslint_config_exists()
	local eslint_config_files = {
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.yaml",
		".eslintrc.yml",
		".eslintrc.json",
		".eslintrc",
	}
	for _, config_file in ipairs(eslint_config_files) do
		if file_exists(config_file) then
			return true
		end
	end
	return false
end

if not use_deno and eslint_config_exists() then
	table.insert(sources, null_ls.builtins.diagnostics.eslint)
end

setup_null_ls(sources)

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
