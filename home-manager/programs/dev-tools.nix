{ pkgs, nix-alien, ... }:

{
  home.packages = with pkgs; [
    devenv
    python3
  ] ++ [
    nix-alien.default
  ];

  programs.npm.enable = true;
  programs.uv.enable = true;
  programs.bun.enable = true;
  programs.java = {
    enable = true;
    package = pkgs.jdk21;
  };
}
