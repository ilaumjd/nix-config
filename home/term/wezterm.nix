env:
let
  fileConfig = builtins.readFile ./wezterm.lua;
  updatedConfig = builtins.replaceStrings [ "USER" ] [ env.user ] fileConfig;
in
{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = true;
    extraConfig = updatedConfig;
  };
}
