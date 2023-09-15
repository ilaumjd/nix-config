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
  nixpkgs.config.permittedInsecurePackages = (import ./packages/insecure.nix pkgs).str;

  # Variables
  home.sessionVariables = {
    NODE_OPTIONS = "--openssl-legacy-provider";
  };

  # Packages
  home.packages = builtins.concatLists [
    (import ./packages pkgs)
    (import ./packages/insecure.nix pkgs).packages
    (import ./packages/darwin.nix pkgs)
  ];

  # Home Manager Programs
  programs = {
    bat = import ./bat.nix pkgs;
    exa = import ./exa.nix;
    fzf = import ./fzf.nix;
    zoxide = import ./zoxide.nix;

    neovim = import ./nvim/nvim.nix pkgs;
    git = import ./git.nix;
    
    # shell
    fish = import ./shell/fish.nix;
    starship = import ./shell/starship.nix;
    wezterm = import ./shell/wezterm.nix;
    zsh = import ./shell/zsh.nix;
  };

}
