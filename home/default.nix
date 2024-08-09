{ pkgs, env, ... }:
{
  # Enable Home Manager
  programs.home-manager.enable = true;

  # State Version
  home.stateVersion = "24.11";

  # Home Configs
  home.username = env.user;
  home.homeDirectory = env.home_path;

  # Variables
  home.sessionVariables = {
    "DIRENV_LOG_FORMAT" = "";
    "EDITOR" = "nvim";
  };

  imports = [
    # common packages
    (import ./packages.nix pkgs env)

    # shell
    (import ./shell/bash.nix)
    (import ./shell/direnv.nix)
    (import ./shell/fish.nix)
    (import ./shell/starship.nix)
    (import ./shell/zellij.nix)
    (import ./shell/zsh.nix pkgs)

    #term
    (import ./term/alacritty.nix env)
    (import ./term/kitty.nix env)
    (import ./term/wezterm.nix env)

    # cli
    (import ./cli/bat.nix pkgs)
    (import ./cli/eza.nix)
    (import ./cli/fzf.nix)
    (import ./cli/thefuck.nix)
    (import ./cli/zoxide.nix)

    # git
    (import ./git/git.nix)
    (import ./git/lazygit.nix)
    (import ./git/scmpuff.nix)
  ];
}
