config:
let
  fileConfig = builtins.readFile ./wezterm.lua;
  updatedConfig = builtins.replaceStrings [ "USER" ] [ config.home.username ] fileConfig;
in
{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    extraConfig = updatedConfig;
  };
}
