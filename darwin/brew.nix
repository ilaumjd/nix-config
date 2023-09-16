{
  enable = true;
  global.brewfile = true;
  onActivation.cleanup = "uninstall";
  caskArgs.no_quarantine = true;
  casks = [
    "brave-browser"
    "firefox"
    "mac-mouse-fix"
  ];
}

