local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, lspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup {
  ensure_installed = { "biome" }
}

lspconfig.setup {
  ensure_installed = { "lua_ls", "tailwindcss",  },
}

require 'lspconfig'.tailwindcss.setup {}
