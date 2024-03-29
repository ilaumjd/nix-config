let
  user = "iam";
  hostname = "macos";
  arch = "aarch64";
  os = "darwin";
  system = "${arch}-${os}";
  home_path = "/Users/${user}";
  package_groups = [
    os
    "default"
    "android"
    "formatter"
    "personal"
    # "works"
  ];
in
{ inherit user hostname arch os system home_path package_groups; }
