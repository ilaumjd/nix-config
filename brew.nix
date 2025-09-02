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
      "gemini-cli"
      "opencode"
    ];
    casks = [
      # "brave-browser"
      "bruno"
      "claude-code"
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
      # "utm"
      "visual-studio-code"
      "wezterm@nightly"
      "zed"
      # "zen"
      "zoom"
    ];
    taps = [
      "sst/tap"
    ];
  };
}
