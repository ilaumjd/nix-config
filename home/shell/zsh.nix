pkgs: {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    autocd = true;
    zsh-abbr = {
      enable = true;
      abbreviations = import ./alias.nix;
    };
    plugins = with pkgs; [
      {
        name = "zsh-fast-syntax-highlighting";
        src = zsh-fast-syntax-highlighting;
        file = "share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh";
      }
      # {
      #   name = "zsh-fzf-tab";
      #   src = zsh-fzf-tab;
      #   file = "share/fzf-tab/fzf-tab.plugin.zsh";
      # }
    ];
    # initExtra = "zstyle ':fzf-tab:*' fzf-pad 4";
    initExtra = ''
      # fish-like line navigation binding
      bindkey '^[[1;9D' beginning-of-line
      bindkey '^[[1;9C' end-of-line

      # rbenv
      eval "$(rbenv init - zsh)"

      # pyenv
      export PYENV_ROOT="$HOME/.pyenv"
      export PATH="$PYENV_ROOT/bin:$PATH"
      eval "$(pyenv init --path)"
      eval "$(pyenv init -)"

      # nvm
      export NVM_DIR="$HOME/.nvm"
      [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
      [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

      # rust
      . "$HOME/.cargo/env"
    '';
  };
}
