{
  enable = true;
  global.brewfile = true;
  onActivation.cleanup = "uninstall";
  caskArgs.no_quarantine = true;
  casks = [
    "brave-browser"
    "firefox"
    "handbrake"
    "iterm2"
    "mac-mouse-fix"
    "raycast"
    "utm"
  ];
}

