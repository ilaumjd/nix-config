{ pkgs, ... }:

{

  # DO NOT CHANGE!!! 
  home.stateVersion = "23.05";

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
    slack
    zoom-us

    # insecure
    nodejs_16
  ];

  # Home Manager Programs
  programs = {
    bat = {
      enable = true;
      config = {
        pager = "less -FR";
        theme = "base16";
      };
      extraPackages = with pkgs.bat-extras; [
        batdiff
        batman
      ];
    };
    exa = {
      enable = true;
      enableAliases = true;
      git = true;
    };
    neovim = {
      enable = true;
      defaultEditor = true;
      plugins = with pkgs.vimPlugins; [
        nvim-surround
        nvim-cmp
        vim-airline
        sonokai

        {
          plugin = lazy-lsp-nvim;
          type = "lua";
          config = ''
            require("lazy-lsp").setup {
              excluded_servers = { 
                "sqls", 
              },
            }
          '';
        }
      ];
      extraLuaConfig = builtins.readFile ./nvim.lua;
    };
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };
    fish = {
      enable = true;
      shellAliases = {
        vi = "nvim";
        vim = "nvim";
      };
      shellAbbrs = {
        cat = "bat";
        rm = "trash";
        cd = "z";
        man = "batman";
        vf = "vim $(fzf)";
      };
    };
    git = {
      enable = true;
      userName = "aulmajid";
      userEmail = "aulmajid@gmail.com";
    };
    starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        character = {
          success_symbol = "[➤](bold green)";
          error_symbol = "[➤](bold red)";
        };
      };
    };
    fzf = {
      enable = true;
      enableFishIntegration = true;
      defaultOptions = [
        "--height ~10"
        "--border double"
      ];
      colors = {
        "bg" = "#2c2e34";
        "bg+" = "#2c2e34";
        "fg" = "#9da0a2";
        "fg+" = "#dcdfe4";
        "hl" = "#df5273";
        "hl+" = "#df5273";
        "spinner" = "#24a8b4";
        "pointer" = "#24a8b4";
        "marker" = "#24a8b4";
        "header" = "#df5273";
        "info" = "#efb993";
        "prompt" = "#efb993";
      };
    };
    wezterm = {
      enable = true;
      extraConfig = builtins.readFile ./wezterm.lua;
    };
  };

}
