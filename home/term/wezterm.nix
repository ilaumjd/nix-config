pkgs:
let
  fileConfig = builtins.readFile ./wezterm.lua;
  updatedConfig = builtins.replaceStrings [ "SHELL_PATH" ] [ "${pkgs.zsh}/bin/zsh" ] fileConfig;
  isx86Darwin = pkgs.stdenv.isDarwin;
in
{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = !isx86Darwin;
    extraConfig = updatedConfig;
  };
}
