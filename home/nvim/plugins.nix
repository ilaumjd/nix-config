pkgs:

with pkgs.vimPlugins; [
  nvim-cmp
  vim-airline

  {
    plugin = lazy-lsp-nvim;
    type = "lua";
    config = ''
      require('lazy-lsp').setup {
        excluded_servers = {
          'sqls',
        },
      }
    '';
  }
  {
    plugin = nvim-surround;
    type = "lua";
    config = "require('nvim-surround').setup()";
  }
  {
    plugin = sonokai;
    config = "colorscheme sonokai";
  }
]
