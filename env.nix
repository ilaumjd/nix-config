let
  user = "nasang";
  hostname = "nixos";
  arch = "x86_64";
  os = "linux";
  system = "${arch}-${os}";
  home_path = "/home/${user}";
  package_groups = [ "default" "formatter" ];
in
{ inherit user hostname arch os system home_path package_groups; }
