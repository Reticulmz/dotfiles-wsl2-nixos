{ config, pkgs, oldPkgs, ... }:

{
  imports = [
    ./programs/git.nix
    ./programs/zsh
    ./programs/direnv.nix
    ./programs/ssh.nix
    ./programs/claude.nix
    ./programs/ide.nix
    ./programs/dev-tools.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  home.username = "reticulmz";
  home.homeDirectory = "/home/reticulmz";
  home.stateVersion = "25.11";

  home.packages = with pkgs; [
  ];

  home.file = { };

  sops.age.keyFile = "/home/reticulmz/.config/sops/age/keys.txt";

  programs.home-manager.enable = true;

}
