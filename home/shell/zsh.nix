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
    initExtra =
      (
        if pkgs.stdenv.isDarwin then
          ''
            # fish-like line navigation binding
            bindkey '^[[1;9D' beginning-of-line
            bindkey '^[[1;9C' end-of-line
            bindkey '^[[1;2D' beginning-of-line
            bindkey '^[[1;2C' end-of-line

            # android
            export JAVA_HOME="/Applications/Android Studio.app/Contents/jbr/Contents/Home"
            export PATH=$PATH:$JAVA_HOME/bin
            export ANDROID_HOME=$HOME/Library/Android/sdk
            export PATH=$PATH:$ANDROID_HOME/emulator
            export PATH=$PATH:$ANDROID_HOME/platform-tools
            export PATH=$PATH:$ANDROID_HOME/build-tools/35.0.0

            # brew
            export PATH=$PATH:/opt/homebrew/opt/postgresql@15/bin
            export PATH=$PATH:$HOME/.cargo/bin
          ''
        else
          ''
            # fish-like line navigation binding
            bindkey '^[[1;5D' beginning-of-line
            bindkey '^[[1;5C' end-of-line
            bindkey '^[[1;2D' beginning-of-line
            bindkey '^[[1;2C' end-of-line
            bindkey '^[[H' beginning-of-line
            bindkey '^[[F' end-of-line
            bindkey '^[[1~' beginning-of-line
            bindkey '^[[4~' end-of-line

            # swift
            export PATH=$PATH:$HOME/swift/usr/bin
          ''
      )
      + ''
        # custom rc
        export PATH=$PATH:$HOME/bin
        source $HOME/.shrc
      '';
  };
}
