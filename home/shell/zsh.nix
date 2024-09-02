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
    ];
    initExtra = ''
      # fish-like line navigation binding
      bindkey '^[[D' beginning-of-line
      bindkey '^[[C' end-of-line

      # android
      export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
      export PATH="$JAVA_HOME/bin:$PATH"
      export ANDROID_HOME=$HOME/Library/Android/sdk
      export PATH=$PATH:$ANDROID_HOME/emulator
      export PATH=$PATH:$ANDROID_HOME/platform-tools
      export PATH=$PATH:$ANDROID_HOME/build-tools/35.0.0
    '';
  };
}
