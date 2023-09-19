{
  enable = true;
  userName = "Ilham AM";
  userEmail = "aulmajid@gmail.com";
  extraConfig = {
    commit.gpgsign = true;
    gpg.format = "ssh";
    gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    user.signingkey = "~/.ssh/id_ed25519.pub";
  };
  ignores = [
    ".envrc"
    ".direnv"
  ];
  delta.enable = true;
}
