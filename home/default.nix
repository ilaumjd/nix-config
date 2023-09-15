{ pkgs, env, ... }:

{
  # DO NOT CHANGE!!! 
  home.stateVersion = "23.05";

  # Home Configs
  home.username = "${env.user}";
  home.homeDirectory = "/Users/${env.user}";

  # Enable Home Manager
  programs.home-manager.enable = true;

  # nixpkgs Configs
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnfreePredicate = (pkgs: true);
  nixpkgs.config.permittedInsecurePackages = (import ./packages-insecure.nix pkgs).str;

  # Variables
  home.sessionVariables = {
    NODE_OPTIONS = "--openssl-legacy-provider";
  };

  # Packages
  home.packages = builtins.concatLists [
    (import ./packages.nix pkgs)
    (import ./packages-insecure.nix pkgs).packages
    (import ./packages-darwin.nix pkgs)
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
