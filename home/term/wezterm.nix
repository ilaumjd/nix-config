pkgs: config:
let
  fileConfig = builtins.readFile ./wezterm.lua;
  updatedConfig = builtins.replaceStrings [ "USER" ] [ config.home.username ] fileConfig;
in
{
  programs.wezterm = {
    enable = true;
    enableBashIntegration = false;
    enableZshIntegration = pkgs.stdenv.isAarch64;
    extraConfig = updatedConfig;
    package = if pkgs.stdenv.isAarch64 then pkgs.wezterm else pkgs.hello;
  };
}
