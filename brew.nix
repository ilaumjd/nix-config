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
      # ios
      "cocoapods"
      # rails
      "libpq"
      "libyaml"
      # ai
      "gemini-cli"
      "opencode"
      # container
      "docker"
      "docker-credential-helper"
      "colima"
    ];
    casks = [
      "bruno"
      "claude-code"
      "dbeaver-community"
      "ente-auth"
      "firefox"
      "ghostty"
      "iina"
      "linearmouse"
      "postman"
      "slack"
      "visual-studio-code"
      "wezterm@nightly"
      "zed"
      "zoom"
    ];
    taps = [
      "sst/tap"
    ];
  };
}
