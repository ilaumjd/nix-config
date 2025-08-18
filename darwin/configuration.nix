{ pkgs, env, ... }:
{
  # State Version
  system.stateVersion = 5;

  nixpkgs.hostPlatform = pkgs.stdenv.system;

  # Nix Configs
  nix = {
    enable = false;
       # gc = {
       #   automatic = true;
       #   interval.Day = 7;
       #   options = "--delete-older-than 7d";
       # };
  };

  # User Configs
  users.users.${env.user} = {
    name = env.user;
    home = /Users/${env.user};
  };

  system.primaryUser = env.user;

  # Environment Configs
  environment = {
    systemPath = [ "/opt/homebrew/bin" ];
    pathsToLink = [ "/Applications" ];
    defaultPackages = with pkgs; [
      atuin
      aria2
      bat
      bat-extras.core
      bottom
      delta
      eza
      fastfetch
      fd
      fzf
      granted
      htop
      imagemagick
      lazygit
      mise
      neovim-unwrapped
      ngrok
      oh-my-posh
      ripgrep
      scmpuff
      stow
      tealdeer
      tmux
      trash-cli
      tree-sitter
      vim
      wget
      yazi
      zoxide
    ];
  };

  fonts = {
    packages = import ../fonts.nix pkgs;
  };

  imports = [
    (import ./system.nix)
    (import ./shell.nix pkgs)
    (import ./brew.nix)
  ];

}
