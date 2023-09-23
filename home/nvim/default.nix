pkgs:

{
  enable = true;
  defaultEditor = true;
  viAlias = true;
  vimAlias = true;
  vimdiffAlias = true;
  plugins = import ./plugins.nix pkgs;
  extraLuaConfig = builtins.readFile ./init.lua;
}
