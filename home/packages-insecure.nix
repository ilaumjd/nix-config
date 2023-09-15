{ pkgs, ... }:

{
  packages = with pkgs; [
    nodejs_16
  ];
  str = [
    "nodejs-16.20.2"
  ];
}
