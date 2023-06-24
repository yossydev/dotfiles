local status, sidebar = pcall(require, 'sidebar-nvim')
if (not status) then return end

sidebar.setup {
  open = false,
  side = "left",
  initial_width = 35,
  update_interval = 1000,
  sections = { "datetime", "git", "diagnostics", "files", "containers" },
  ["git"] = {
    icon = "",
  },
  ["diagnostics"] = {
    icon = "",
  },
  datetime = {
    icon = "",
    format = "%a %b %d, %H:%M",
    clocks = {
      { name = "local" }
    }
  },
  containers = {
    icon = "",
    use_podman = false,
    attach_shell = "/bin/sh",
    show_all = true, -- whether to run `docker ps` or `docker ps -a`
    interval = 5000, -- the debouncer time frame to limit requests to the docker daemon
  },
  buffers = {
    icon = "",
    ignored_buffers = {}, -- ignore buffers by regex
    sorting = "id", -- alternatively set it to "name" to sort by buffer name instead of buf id
    show_numbers = true, -- whether to also show the buffer numbers
    ignore_not_loaded = false, -- whether to ignore not loaded buffers
    ignore_terminal = true, -- whether to show terminal buffers in the list
  },
  files = {
    icon = "",
    show_hidden = false,
    ignored_paths = { "%.git$" }
  },
  todos = {
    icon = "",
    ignored_paths = { '~' }, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
    initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
  },
}

vim.keymap.set('n', '<space>s', '<cmd>SidebarNvimToggle<cr>')
vim.keymap.set('n', '<space>S', '<cmd>SidebarNvimFocus<cr>')
