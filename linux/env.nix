let
  user = "iam";
  arch = "x86_64";
in
{
  inherit user;
  system = "${arch}-linux";
}
