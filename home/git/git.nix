{
  programs.git = {
    enable = true;
    userName = "ilaumjd";
    userEmail = "ilaumjd@gmail.com";
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
  };
}
