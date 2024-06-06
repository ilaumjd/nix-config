let
  user = "iam";
  hostname = "macos";
  arch = "aarch64";
  os = "darwin";
  system = "${arch}-${os}";
  home_path = "/Users/${user}";
in
{ inherit user hostname arch os system home_path; }
