let
  user = "iam";
  hostname = "macos";
  arch = "aarch64";
in
{
  inherit user hostname;
  system = "${arch}-darwin";
}
