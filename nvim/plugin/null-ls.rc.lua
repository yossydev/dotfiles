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

local rootPath = vim.fn.getcwd()
local biomeJsonPath = rootPath .. "/biome.json"

if file_exists(biomeJsonPath) then
	setup_null_ls({
		null_ls.builtins.formatting.biome,
		null_ls.builtins.diagnostics.fish,
	})
	print("biome.json found. LSP formatting with Biome is enabled.")
else
	setup_null_ls({
		null_ls.builtins.formatting.prettierd,
		-- ref: https://github.com/johnnyBira/neovim-config/blob/84bb2a40675ff5e64cbd69e5f410dfae653a89c5/lua/bira/plugins/null-ls.lua
		require("none-ls.diagnostics.eslint_d").with({
			extra_args = function(params)
				local file_types = {
					"eslint.config.js",
					"eslint.config.mjs",
					".eslintrc.js",
					".eslintrc.cjs",
					".eslintrc.yaml",
					".eslintrc.yml",
					".eslintrc.json",
					".eslintrc",
				}
				for _, file_type in ipairs(file_types) do
					local config_path = params.root .. "/" .. file_type
					if file_exists(config_path) then
						return { "--config", config_path }
					end
				end
				return {}
			end,
			diagnostics_format = "[eslint] #{m}\n(#{c})",
		}),
		null_ls.builtins.diagnostics.fish,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.clang_format,
	})
end

vim.api.nvim_create_user_command("DisableLspFormatting", function()
	vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
