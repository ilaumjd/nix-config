env:

{
  enable = true;
  global.brewfile = true;
  onActivation = {
    autoUpdate = true;
    cleanup = "uninstall";
    upgrade = true;
  };
  caskArgs.no_quarantine = true;
  casks = [
    "brave-browser"
    "firefox"
    "raycast"
  ]
  ++ (
    if env.arch == "aarch64" then
      [ "mac-mouse-fix" ]
    else
      [ "mouse-fix" ]
  );
}

