{ pkgs, ... }:

{

  # DO NOT CHANGE!!! 
  home.stateVersion = "23.05";

  # Packages
  home.packages = with pkgs; [

    # cli
    neofetch
    bottom
    trash-cli

    # gui
    vscodium
    slack
    zoom-us

    # insecure
    nodejs_16
  ];

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

  # Home Manager Programs
  programs = {
    home-manager.enable = true;
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
      extraConfig = ''
        set number
        set relativenumber
        set cursorline
        set scrolloff=5
        set tabstop=2
        set shiftwidth=2
        set expandtab
        set autoindent
        set ignorecase
        set smartcase
          
        if has('termguicolors')
          set termguicolors
        endif
        colorscheme sonokai
      '';
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
    ripgrep = {
      enable = true;
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
    tealdeer = {
      enable = true;
    };
    wezterm = {
      enable = true;
      extraConfig = ''
        local config = {}
        if wezterm.config_builder then config = wezterm.config_builder() end
          
        config.default_prog = { '/etc/profiles/per-user/iam/bin/fish', '-l' }
        config.font = wezterm.font('SauceCodePro Nerd Font')
        config.font_size = 15.0
        config.hide_tab_bar_if_only_one_tab = true
        config.window_background_opacity = 1.0
        config.default_cursor_style = 'BlinkingUnderline'

        local scheme = wezterm.get_builtin_color_schemes()['Sonokai (Gogh)']
        scheme.cursor_bg = '#ffb473'
        scheme.cursor_fg = '#ffffff'
        config.color_schemes = {
          ['scheme'] = scheme
        }
        config.color_scheme = 'scheme'

        return config
      '';
    };
  };

}
