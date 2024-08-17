env: {
  homebrew = {
    enable = true;
    global.brewfile = true;
    onActivation = {
      autoUpdate = false;
      cleanup = "uninstall";
      upgrade = false;
    };
    caskArgs = {
      require_sha = false;
      no_quarantine = true;
    };
    brews = [
      # aws
      "awscli"
      "aws-sam-cli"
      # ruby
      "gmp"
      "rbenv"
      # mobile
      "cocoapods"
      "fastlane"
      # python
      "pyenv"
      # nodejs
      "nvm"
      # rust
      "rustup"
    ];
    casks = [
      "brave-browser"
      "docker"
      "firefox"
      "linearmouse"
      "raycast"
    ];
    taps = [ ];
  };
}
