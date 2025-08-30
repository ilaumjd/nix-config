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
      "bruno"
      # "discord"
      "dbeaver-community"
      "ente-auth"
      "firefox"
      "ghostty"
      "iina"
      "linearmouse"
      "orbstack"
      "postman"
      # "raycast"
      "slack"
      "stolendata-mpv"
      "ungoogled-chromium"
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
