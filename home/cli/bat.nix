pkgs: {
  programs.bat = {
    enable = true;
    config = {
      pager = "less -FR";
      style = "plain";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
    ];
  };
}
