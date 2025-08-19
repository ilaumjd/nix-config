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
      "libpq"
      "libyaml"
      "postgresql@14"
    ];
    casks = [
      "brave-browser"
      # "discord"
      "docker-desktop"
      "dbeaver-community"
      "ente-auth"
      "firefox"
      "ghostty"
      "iina"
      "linearmouse"
      # "raycast"
      "slack"
      "stolendata-mpv"
      # "utm"
      "visual-studio-code"
      "wezterm"
      # "zed"
      # "zen"
      "zoom"
    ];
    taps = [
    ];
  };
}
