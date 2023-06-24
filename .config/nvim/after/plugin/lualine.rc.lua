local status, lualine = pcall(require, 'lualine')
if (not status) then return end

lualine.setup {
  options = {
   icons_enabled = true,
   theme = 'solarized_dark',
   section_separators = { left = '▶︎', right = '◀︎'},
   component_separators = { left = '>', right = '<'},
   disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = { {
      'filename',
      file_status = true, -- display file status
      path = 0 -- 0 = just filename
    } },
    lualine_x = {
      { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = '🪲 ', warn ='⚠️ ', info = '📣 ', hint ='💡', }},
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{
      'filename',
      filestatus= true,
      path = 1 -- 1 = reactive path
    }},
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extentions = { 'fugitive' }
}
