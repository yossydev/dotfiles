local wezterm = require 'wezterm'

wezterm.on('window-config-reloaded', function(window)
  window:toast_notification('wezterm', 'Configuration reloaded!', nil, 4000)
end)

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  return {
    { Text=" " .. tab.active_pane.title .. " " },
  }
end)


local config = {}

config.initial_cols = 190
config.initial_rows = 60

-- disable ligatures: https://wezfurlong.org/wezterm/config/font-shaping.html#advanced-font-shaping-options
config.harfbuzz_features = {'calt=0', 'clig=0', 'liga=0'}

config.font = wezterm.font('Moralerspace Radon', {
  weight = 'Regular',
  stretch = 'Normal',
  style = 'Normal',
})
config.font_size = 14.0

-- port from: https://github.com/wadackel/vim-dogrun/blob/main/colors/dogrun.vim
config.colors = {
  foreground = '#9ea3c0',
  background = '#222433',
  cursor_fg = '#222433',
  cursor_bg = '#9ea3c0',
  selection_bg = '#363e7f',
  ansi = {
    '#111219',
    '#c2616b',
    '#7cbe8c',
    '#8e8a6f',
    '#4c89ac',
    '#6c75cb',
    '#73c1a9',
    '#9ea3c0',
  },
  brights = {
    '#545c8c',
    '#b871b8',
    '#7cbe8c',
    '#a8a384',
    '#589ec6',
    '#929be5',
    '#59b6b6',
    '#9ea3c0',
  },
  tab_bar = {
    background = "#1b1f2f",
    active_tab = {
      bg_color = "#444b71",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = "#282d3e",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    inactive_tab_hover = {
      bg_color = "#1b1f2f",
      fg_color = "#c6c8d1",
      intensity = "Normal",
      underline = "None",
      italic = true,
      strikethrough = false,
    },
    new_tab = {
      bg_color = "#1b1f2f",
      fg_color = "#c6c8d1",
      italic = false
    },
    new_tab_hover = {
      bg_color = "#444b71",
      fg_color = "#c6c8d1",
       italic = false
    },
  }
}

config.enable_scroll_bar = false
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.skip_close_confirmation_for_processes_named = {""}
config.disable_default_key_bindings = true

config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = 'RESIZE'
config.window_padding = {
  left = '1cell',
  right = '1cell',
  top = '0.5cell',
  bottom = '0.5cell',
}

config.keys = {
  -- 新しいタブを開く
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SpawnTab('CurrentPaneDomain'),
  },
  -- タブを閉じる
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentTab{ confirm = true }
  },
  -- コピー
  {
    key = 'c',
    mods = 'CMD',
    action = wezterm.action.CopyTo('ClipboardAndPrimarySelection'),
  },
  -- ペースト
  { 
    key = 'v', 
    mods = 'CMD', 
    action = wezterm.action.PasteFrom('Clipboard')
  },
  -- 新規Window
  {
    key = 'n',
    mods = 'CMD',
    action = wezterm.action.SpawnWindow,
  },
  -- リロード
  {
    key = 'r',
    mods = 'CMD',
    action = wezterm.action.ReloadConfiguration,
  },
  {
    key = '-',
    mods = 'CMD',
    action = wezterm.action.DecreaseFontSize,
  },
  {
    key = '+',
    mods = 'CMD|SHIFT',
    action = wezterm.action.IncreaseFontSize,
  },
  {
    key = '0',
    mods = 'CMD',
    action = wezterm.action.ResetFontSize,
  },
  -- Ctrl+Shift+dで新しいペインを作成(画面を分割)
  {
    key = 'd',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  -- Ctrl+Shift+sで新しいペインを作成(画面を分割)
  {
    key = 's',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  }, 
  -- CTRL + [でペインを移動 
  { 
    key = '[', 
    mods = 'CTRL', 
    action = wezterm.action.PaneSelect
  },
  -- WezTermの終了
  {
    key = "q",
    mods = "SHIFT|CTRL",
    action = wezterm.action.QuitApplication
  },
}

for i = 1, 8 do
  -- CTRL+ALT + number to activate that tab
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CMD',
    action = wezterm.action.ActivateTab(i - 1),
  })
  -- F1 through F8 to activate that tab
  table.insert(config.keys, {
    key = 'F' .. tostring(i),
    action = wezterm.action.ActivateTab(i - 1),
  })
end

return config
