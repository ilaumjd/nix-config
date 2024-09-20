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
    ];
    casks = [
      "brave-browser"
      "docker"
      "firefox"
      "iina"
      "linearmouse"
      "raycast"
      "zed@preview"
      "zen-browser"
    ] ++ (if pkgs.stdenv.isDarwin then [ "wezterm" ] else [ ]);
    taps = [ ];
  };
}
