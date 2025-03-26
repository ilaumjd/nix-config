{
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
      "cocoapods"
      "fastlane"
      "postgresql@15"
      "watchman"
      "awscli"
      "aws-sam-cli"
    ];
    casks = [
      "brave-browser"
      "docker"
      "ghostty"
      "iina"
      "linearmouse"
      "raycast"
      "slack"
      "stolendata-mpv"
      "utm"
      "zed@preview"
      "zen-browser"
      "zoom"
    ];
    taps = [
      "homebrew/services"
    ];
  };
}
