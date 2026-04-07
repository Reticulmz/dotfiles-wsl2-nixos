{ pkgs, ... }:

{
  home.packages = with pkgs; [
    devenv
  ];

  programs.npm.enable = true;
  programs.uv.enable = true;
  programs.bun.enable = true;
}
