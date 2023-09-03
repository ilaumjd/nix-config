{ pkgs, ... }: 

{
  
  # DO NOT CHANGE!!!
  system.stateVersion = 4;

  services.nix-daemon.enable = true;
  nix.settings.experimental-features = "nix-command flakes";
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Paths
  users.users.iam.home = "/Users/iam";
  environment.systemPath = [ "/opt/homebrew/bin" ];
  environment.pathsToLink = [ "/Applications" ];
  
  # Shell
  environment.shells = [ pkgs.zsh ];
  environment.loginShell = pkgs.zsh;
  environment.shellAliases = {
    vi = "nvim";
    vim = "nvim";
    cat = "bat";
    rm = "trash";
    cd = "z";
  };
  programs = {
    zsh = { 
      enable = true;
      enableSyntaxHighlighting = true;
    };
  };

  # System Settings
  system.defaults.finder._FXShowPosixPathInTitle = true;
  system.defaults.NSGlobalDomain.NSAutomaticSpellingCorrectionEnabled = false;
  system.defaults.dock.autohide = true;
  system.defaults.dock.mru-spaces = false;
  system.defaults.finder.QuitMenuItem = true;
  system.defaults.finder.ShowPathbar = true;
  system.defaults.loginwindow.GuestEnabled = false;
  system.defaults.trackpad.Clicking = true;

  # Homebrew
  homebrew = {
    enable = true;
    global.brewfile = true;
    onActivation.cleanup = "zap";
    caskArgs.no_quarantine = true;
    casks = [
      "brave-browser"
      "firefox"
      "iterm2"
      "mac-mouse-fix"
      "utm"
      "vscodium"

      # works
      "slack"
      "zoom"
    ];
  };

}
