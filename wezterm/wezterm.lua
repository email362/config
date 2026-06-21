local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 12.0
config.colors = {
  background = "#1a1b26",
  foreground = "#a9b1d6",
}
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

if wezterm.target_triple:find("windows") then
  config.default_prog = { "wsl.exe", "--cd", "~", "--exec", "/usr/bin/zsh", "-l" }
elseif wezterm.target_triple:find("darwin") then
  config.default_prog = { "/bin/zsh", "-l" }
end

return config
