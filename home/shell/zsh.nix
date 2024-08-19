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

      # asdf
      . "${pkgs.asdf-vm}/share/asdf-vm/asdf.sh"
      . "${pkgs.asdf-vm}/share/asdf-vm/completions/asdf.bash"

      # android
      export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
      export PATH="$JAVA_HOME/bin:$PATH"
      export ANDROID_HOME=$HOME/Library/Android/sdk
      export PATH=$PATH:$ANDROID_HOME/emulator
      export PATH=$PATH:$ANDROID_HOME/tools
      export PATH=$PATH:$ANDROID_HOME/tools/bin
      export PATH=$PATH:$ANDROID_HOME/platform-tools
    '';
  };
}
