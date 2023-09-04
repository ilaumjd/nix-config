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
      };
      exa = {
        enable = true;
        enableAliases = true;
        git = true;
      };
      neovim = {
        enable = true;
      };
      zoxide = {
        enable = true;
        enableFishIntegration = true;
      };
      fish = {
        enable = true;
        shellAbbrs = {
          vi = "nvim";
          vim = "nvim";
          cat = "bat";
          rm = "trash";
          cd = "z";
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
      };
  };
  
}
