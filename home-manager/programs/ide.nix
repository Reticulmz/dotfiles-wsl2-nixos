{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vimPlugins.LazyVim
    jetbrains.ruby-mine
  ];

  programs.jetbrains-remote = {
    enable = true;
    ides = with pkgs.jetbrains; [ ruby-mine ];
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
