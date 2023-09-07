{ pkgs, ... }:

{
  
  # DO NOT CHANGE!!! 
  home.stateVersion = "23.05";

  # Packages
  home.packages = with pkgs; [
    neofetch
    bottom
    trash-cli
  ];
 
  # Home Manager Programs 
  programs = { 
      home-manager.enable = true; 
      bat = {
        enable = true;
        config = {
          pager = "less -FR";
          theme = "Monokai Extended Origin";
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
        plugins = with pkgs.vimPlugins; [
          sonokai
          nvim-cmp
          vim-airline
        ];
        extraConfig = ''
          syntax enable
      
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

          colorscheme sonokai
        '';
      };
      zoxide = {
        enable = true;
        enableFishIntegration = true;
      };
      fish = {
        enable = true;
        shellAbbrs = {
          cat = "bat";
          rm = "trash";
          cd = "z";
          man = "batman";
          nvimfzf = "nvim $(fzf)";
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
          "bg" = "#2e2a2e";
          "bg+" = "#2e2a2e";
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
  };
  
}
