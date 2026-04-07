{ ... }:

{
  programs.ssh.extraConfig = ''
    Host github github.com
      HostName github.com
      IdentityFile ~/.ssh/id_ed25519.pub
      User git
  '';
}
