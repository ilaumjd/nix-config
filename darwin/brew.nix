env:

{
  enable = true;
  global.brewfile = true;
  onActivation.cleanup = "uninstall";
  caskArgs.no_quarantine = true;
  brews = [];
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

