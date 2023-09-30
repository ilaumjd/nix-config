let
  user = "iam";
  hostname = "macos";
  arch = "aarch64";
  os = "darwin";
  system = "${arch}-${os}";
in
{
  inherit user hostname arch os system;
}
