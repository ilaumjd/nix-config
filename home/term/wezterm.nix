pkgs: config:
let
  fileConfig = builtins.readFile ./wezterm.lua;
  updatedConfig = builtins.replaceStrings [ "USER" ] [ config.home.username ] fileConfig;
  isx86Darwin = pkgs.stdenv.isx86_64 && pkgs.stdenv.isDarwin;
in
{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = !isx86Darwin;
    extraConfig = updatedConfig;
    package = if isx86Darwin then pkgs.hello else pkgs.wezterm;
  };
}
