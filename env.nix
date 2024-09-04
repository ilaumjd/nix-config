let
  user = "iam";
  hostname = "macos";
  arch = "aarch64";
  os = "darwin";
in
{
  inherit user hostname;
  system = "${arch}-${os}";
}
