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

  # Packages
  home.packages = builtins.concatLists [
    (import ./packages pkgs)
    (import ./packages/insecure.nix pkgs).packages
    (import ./packages/darwin.nix pkgs)
  ];

  # Home Manager Programs
  programs = {

    # shell
    direnv = import ./shell/direnv.nix;
    fish = import ./shell/fish.nix;
    starship = import ./shell/starship.nix;
    wezterm = import ./shell/wezterm.nix;
    zsh = import ./shell/zsh.nix;

    #cli
    bat = import ./cli/bat.nix pkgs;
    exa = import ./cli/exa.nix;
    fzf = import ./cli/fzf.nix;
    zoxide = import ./cli/zoxide.nix;

    neovim = import ./nvim/nvim.nix pkgs;
    git = import ./git.nix;

  };

}
