pkgs:

{
  programs = {
    bash.enable = true;
    zsh.enable = true;
    fish.enable = true;
  };
  environment.shells = with pkgs; [
    bash
    zsh
    fish
  ];
}
