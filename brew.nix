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
      "postgresql@16"
    ];
    casks = [
      # "brave-browser"
      # "discord"
      "dbeaver-community"
      "ente-auth"
      "firefox"
      "ghostty"
      "iina"
      "linearmouse"
      "orbstack"
      # "raycast"
      "slack"
      "stolendata-mpv"
      # "utm"
      "visual-studio-code"
      "wezterm@nightly"
      "zed"
      # "zen"
      "zoom"
    ];
    taps = [
    ];
  };
}
