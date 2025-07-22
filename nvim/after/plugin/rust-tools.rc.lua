local status, rt = pcall(require, "rust-tools")
if (not status) then return end

local function on_attach(client, buffer)
	-- This callback is called when the LSP is atttached/enabled for this buffer
	-- we could set keymaps related to LSP, etc here.
end

local opts = {
	tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},

	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	server = {
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				checkOnSave = {
					command = "clippy",
				},
				procMacro = {
					enable = true,
					server = {
						path = os.getenv("HOME")
							.. "/.local/share/mise/installs/rust/1.77.1/toolchains/1.77.1-aarch64-apple-darwin/libexec/rust-analyzer-proc-macro-srv",
					},
				},
				diagnostics = {
					disabled = { "unresolved-proc-macro" },
				},
			},
		},
	},
}

rt.setup(opts)
