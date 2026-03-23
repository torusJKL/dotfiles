local wezterm = require 'wezterm'

local config = wezterm.config_builder()

config.colors = {
    background = "#1e1e2e",
}

config.keys = {
    -- Send special commands for Emacs
    {
        key = ",",
        mods = "CTRL",
        action = wezterm.action.SendString("\x1b[1;5l"),  -- ESC [ 1 ; 5 l
    },
    {
        key = "UpArrow",
        mods = "CTRL|SHIFT",
        action = wezterm.action.SendString("\x1b[1;6A"),  -- ESC [ 1 ; 6 A
    },
    {
        key = "DownArrow",
        mods = "CTRL|SHIFT",
        action = wezterm.action.SendString("\x1b[1;6B"),  -- ESC [ 1 ; 6 B
    },

    -- Disable default ALT+Enter fullscreen toggle
    {
      key = "Enter",
      mods = "ALT",
      action = wezterm.action.DisableDefaultAssignment,
    },

    -- Add custom ALT+F fullscreen toggle
    {
      key = "f",
      mods = "ALT",
      action = wezterm.action.ToggleFullScreen,
    },
}

config.font = wezterm.font_with_fallback {
    'Cousine Nerd Font Mono',
    'JetBrains Mono',
}

config.bidi_enabled = true
config.hide_tab_bar_if_only_one_tab = true

return config
