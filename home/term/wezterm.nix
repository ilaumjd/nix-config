pkgs: config:
let
  fileConfig = builtins.readFile ./wezterm.lua;
  updatedConfig = builtins.replaceStrings [ "USER" ] [ config.home.username ] fileConfig;
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
