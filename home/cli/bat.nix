pkgs:

{
  programs.bat =
    {
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
}
