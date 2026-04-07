{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    zsh
  ];

  programs.zsh.enable = true;
  users.users.reticulmz.shell = pkgs.zsh;
}
