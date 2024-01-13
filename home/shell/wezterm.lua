---@diagnostic disable: undefined-global
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = { "/etc/profiles/per-user/nasang/bin/fish", "-l" }
--config.font = wezterm.font("MesloLGS Nerd Font")
config.font_size = 15.0
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 1.0
config.default_cursor_style = "BlinkingUnderline"

local scheme = wezterm.get_builtin_color_schemes()["Vs Code Dark+ (Gogh)"]
scheme.cursor_fg = "#373837"
scheme.cursor_bg = "#ededed"
config.color_schemes = {
  ["scheme"] = scheme,
}
config.color_scheme = "scheme"

return config
