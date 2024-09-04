let
  user = "iam";
  arch = "x86_64";
  os = "linux";
in
{
  inherit user;
  system = "${arch}-${os}";
}
