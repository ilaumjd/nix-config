pkgs:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    autocd = true;
    zsh-abbr = {
      enable = true;
      abbreviations = import ./alias.nix;
    };
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
      # {
    ];
  };
}
