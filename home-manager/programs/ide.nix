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

  services.vscode-server = {
    enable = true;
    enableFHS = true;
  };

  services.antigravity-server = {
    enable = true;
    enableFHS = true;
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };
}
