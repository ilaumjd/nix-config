{
  programs.git = {
    enable = true;
    userName = "ilaumjd";
    userEmail = "ilaumjd@gmail.com";
    lfs.enable = true;
    signing = {
      format = "ssh";
      key = "~/.ssh/id_ed25519.pub";
      signByDefault = true;
    };
    extraConfig = {
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };
    ignores = [
      ".envrc"
      ".direnv"
    ];
    delta.enable = true;
  };
}
