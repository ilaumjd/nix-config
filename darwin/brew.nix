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
    casks = [ "brave-browser" "firefox" "raycast" ]
      ++ (if env.arch == "aarch64" then
        [ "mac-mouse-fix" ]
      else
        [ "mouse-fix" ]);
  };
}
