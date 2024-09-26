let
  user = "ilham";
  hostname = "colearn";
  arch = "x86_64";
in
{
  inherit user hostname;
  system = "${arch}-darwin";
}
