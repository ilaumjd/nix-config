pkgs:
let
  fileConfig = builtins.readFile ./wezterm.lua;
  updatedConfig = builtins.replaceStrings [ "SHELL_PATH" ] [ "${pkgs.zsh}/bin/zsh" ] fileConfig;
in
{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = false;
    extraConfig = updatedConfig;
  };
}
