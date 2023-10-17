{ pkgs, env, ... }: {
  # Enable Home Manager
  programs.home-manager.enable = true;

  # State Version
  home.stateVersion = "23.05";

  # Home Configs
  home.username = env.user;
  home.homeDirectory = env.home_path;

  # Variables
  home.sessionVariables = { "DIRENV_LOG_FORMAT" = ""; };

  imports = [
    # common packages
    (import ./packages pkgs)
    (import ./packages/${env.os}.nix pkgs)

    # shell
    (import ./shell/bash.nix)
    (import ./shell/direnv.nix)
    (import ./shell/fish.nix)
    (import ./shell/starship.nix)
    (import ./shell/wezterm.nix)
    (import ./shell/zellij.nix)
    (import ./shell/zsh.nix pkgs)

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

    # text editor
    # (import ./nvim pkgs)
    (import ./nixvim pkgs)
    (import ./vscode.nix)
  ];
  programs.alacritty = {
    enable = true;
    settings = import ./shell/alacritty.nix;
  };
}
