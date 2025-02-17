{ pkgs, config, ... }:
{
  # Enable Home Manager
  programs.home-manager.enable = true;

  # State Version
  home.stateVersion = "24.11";

  # Variables
  home.sessionVariables = {
    "DIRENV_LOG_FORMAT" = "";
    "EDITOR" = "nvim";
    "SHELL" = "${pkgs.zsh}/bin/zsh";
  };

  # Fonts
  fonts.fontconfig.enable = true;

  imports = [
    # common packages
    (import ./packages.nix pkgs)

    # shell
    (import ./shell/atuin.nix)
    (import ./shell/bash.nix)
    (import ./shell/direnv.nix)
    # (import ./shell/fish.nix)
    (import ./shell/oh-my-posh.nix)
    # (import ./shell/starship.nix)
    (import ./shell/tmux.nix pkgs)
    # (import ./shell/zellij.nix)
    (import ./shell/zsh.nix pkgs)

    # term
    # (import ./term/alacritty.nix config)
    (import ./term/ghostty.nix pkgs)
    # (import ./term/kitty.nix config)
    (import ./term/wezterm.nix pkgs)

    # cli
    (import ./cli/bat.nix pkgs)
    (import ./cli/eza.nix)
    (import ./cli/fastfetch.nix)
    (import ./cli/fzf.nix)
    (import ./cli/mise.nix)
    (import ./cli/thefuck.nix)
    (import ./cli/yazi.nix)
    (import ./cli/zoxide.nix)

    # git
    (import ./git/git.nix)
    (import ./git/lazygit.nix)
    (import ./git/scmpuff.nix)

    # vim
    (import ./vim/vim.nix pkgs)
  ];
}
