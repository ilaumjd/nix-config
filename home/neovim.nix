{ pkgs, ... }:

{
  enable = true;
  defaultEditor = true;
  plugins = with pkgs.vimPlugins; [
    nvim-surround
    nvim-cmp
    vim-airline
    sonokai

    {
      plugin = lazy-lsp-nvim;
      type = "lua";
      config = ''
        require("lazy-lsp").setup {
          excluded_servers = { 
            "sqls", 
          },
        }
      '';
    }
  ];
  extraLuaConfig = builtins.readFile ./neovim.lua;
}
