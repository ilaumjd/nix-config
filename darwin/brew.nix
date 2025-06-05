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
      "discord"
      "docker"
      "dbeaver-community"
      "ghostty"
      "iina"
      "linearmouse"
      "raycast"
      "slack"
      "stolendata-mpv"
      "utm"
      "visual-studio-code"
      "zed@preview"
      "zen"
      "zoom"
    ];
    taps = [
      "homebrew/services"
    ];
  };
}
