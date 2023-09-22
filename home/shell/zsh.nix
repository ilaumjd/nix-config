pkgs:

{
  enable = true;
  enableAutosuggestions = true;
  autocd = true;
  shellAliases = import ./alias.nix;
  plugins = with pkgs; [
    {
      name = "zsh-autocomplete";
      src = zsh-autocomplete;
      file = "share/zsh-autocomplete/zsh-autocomplete.plugin.zsh";
    }
    {
      name = "zsh-fast-syntax-highlighting";
      src = zsh-fast-syntax-highlighting;
      file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
    }
    #    {
    #      name = "zsh-fzf-tab";
    #      src = zsh-fzf-tab;
    #      file = "share/fzf-tab/fzf-tab.plugin.zsh";
    #    }
    #    {
    #      name = "zsh-abbr";
    #      src = fetchFromGitHub {
    #        owner = "olets";
    #        repo = "zsh-abbr";
    #        rev = "v5.1.0";
    #        sha256 = "iKL2vn7TmQr78y0Bn02DgNf9DS5jZyh6uK9MzYTFZaA=";
    #      };
    #    }
  ];
  #  initExtra = ''
  #    zstyle ':fzf-tab:*' fzf-pad 4
  #  '';
}
