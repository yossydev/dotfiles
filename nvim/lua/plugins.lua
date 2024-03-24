local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "svrana/neosolarized.nvim" },
	{ "nvim-tree/nvim-tree.lua" },
	{ "nvim-lualine/lualine.nvim" }, -- Statusline
	{ "nvim-lua/plenary.nvim" }, -- Common utilities
	{ "onsails/lspkind-nvim" }, -- vscode-like pictograms
	{ "hrsh7th/nvim-cmp" }, -- Completion
	{ "hrsh7th/cmp-nvim-lsp" }, -- nvim-cmp source for neovim's built-in LSP
	{ "hrsh7th/cmp-buffer" }, -- nvim-cmp source for buffer words
	{ "neovim/nvim-lspconfig" }, -- LSP
	{ "nvimtools/none-ls.nvim" }, -- Use Neovim as a language server
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "MunifTanjim/prettier.nvim" },
	{ "nvimdev/lspsaga.nvim" },
	{ "L3MON4D3/LuaSnip" },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ "kyazdani42/nvim-web-devicons" }, -- File icons
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "windwp/nvim-autopairs" },
	{ "windwp/nvim-ts-autotag" },
	{ "numToStr/Comment.nvim" },
	{ "norcalli/nvim-colorizer.lua" },
	{ "folke/zen-mode.nvim" },
	{ "akinsho/nvim-bufferline.lua" },
	-- { "github/copilot.vim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "dinhhuy258/git.nvim" }, -- For git blame & browse
	{ "sindrets/diffview.nvim" },
	{ "rust-lang/rust.vim" },
	{ "simrat39/rust-tools.nvim" },

	-- Flutter
	{ "akinsho/flutter-tools.nvim" },

	-- Go
	{ "ray-x/go.nvim" },
	{ "ray-x/guihua.lua" }, -- recommended if need floating window support

	-- colorchema
	{ "projekt0n/github-nvim-theme" },
})
