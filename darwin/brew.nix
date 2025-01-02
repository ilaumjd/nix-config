pkgs: {
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
    ];
    casks = [
      "brave-browser"
      "docker"
      "iina"
      "linearmouse"
      "raycast"
      "stolendata-mpv"
      "zed@preview"
      "zen-browser"
    ] ++ (if pkgs.stdenv.isx86_64 then [ "wezterm" ] else [ ]);
    taps = [
      "homebrew/services"
    ];
  };
}
