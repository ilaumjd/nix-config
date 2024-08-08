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
    ];
    casks = [
      "brave-browser"
      "docker"
      "firefox"
      "linearmouse"
      "localsend"
      "raycast"
      "wezterm"
    ];
    taps = [ "localsend/localsend" ];
  };
}
