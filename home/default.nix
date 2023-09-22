{ pkgs, env, ... }:

{
  # DO NOT CHANGE!!! 
  home.stateVersion = "23.05";

  # Home Configs
  home.username = "${env.user}";
  home.homeDirectory = "/Users/${env.user}";

  # Enable Home Manager
  programs.home-manager.enable = true;

  # Variables
  home.sessionVariables = {
    "DIRENV_LOG_FORMAT" = "";
  };

  # nixpkgs Configs
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkgs: true);

  # Packages
  home.packages = builtins.concatLists [
    (import ./packages pkgs)
    (import ./packages/darwin.nix pkgs)
  ];

  # Home Manager Programs
  programs = {

    # shell
    bash = import ./shell/bash.nix;
    direnv = import ./shell/direnv.nix;
    fish = import ./shell/fish.nix;
    starship = import ./shell/starship.nix;
    wezterm = import ./shell/wezterm.nix;
    zsh = import ./shell/zsh.nix pkgs; 

    # cli
    bat = import ./cli/bat.nix pkgs;
    eza = import ./cli/eza.nix;
    fzf = import ./cli/fzf.nix;
    zoxide = import ./cli/zoxide.nix;

    # git
    git = import ./git/git.nix;
    lazygit = import ./git/lazygit.nix;
    
    neovim = import ./nvim/nvim.nix pkgs;
    vscode = import ./vscode.nix;
  };

  targets.darwin.currentHostDefaults."com.apple.controlcenter".BatteryShowPercentage = true;
}
