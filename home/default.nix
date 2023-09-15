{ pkgs, ... }:

{
  # DO NOT CHANGE!!! 
  home.stateVersion = "23.05";

  # Home config
  home.username = "iam";
  home.homeDirectory = "/Users/iam";

  # Enable Home Manager
  programs.home-manager.enable = true;

  # nixpkgs Configs
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.permittedInsecurePackages = [
    "nodejs-16.20.2"
  ];

  # Variables
  home.sessionVariables = {
    NODE_OPTIONS = "--openssl-legacy-provider";
    NIXPKGS_ALLOW_INSECURE = 1;
  };

  # Packages
  home.packages = with pkgs; [

    # cli
    neofetch
    bottom
    trash-cli
    ripgrep
    tealdeer

    # gui
    vscodium
    # slack
    #zoom-us

    # insecure
    nodejs_16
  ];

  # Home Manager Programs
  programs = {
    bat = import ./bat.nix pkgs;
    exa = import ./exa.nix;
    fzf = import ./fzf.nix;
    zoxide = import ./zoxide.nix;
    neovim = import ./neovim.nix pkgs;
    fish = import ./fish.nix;
    git = import ./git.nix;
    starship = import ./starship.nix;
    wezterm = import ./wezterm.nix;
    zsh = import ./zsh.nix;
  };

}
