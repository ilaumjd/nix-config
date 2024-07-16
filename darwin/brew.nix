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
    brews = [
      "awscli"
      "aws-sam-cli"
    ];
    casks = [
      "brave-browser"
      "docker"
      "firefox"
      "linearmouse"
      "localsend"
      "raycast"
    ];
    taps = [ "localsend/localsend" ];
  };
}
