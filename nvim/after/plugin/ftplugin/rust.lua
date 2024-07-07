vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition()
end, { buffer = bufnr, desc = "goto definition" })

vim.g.rustaceanvim = {
	server = {
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
