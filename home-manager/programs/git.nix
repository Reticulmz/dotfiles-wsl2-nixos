{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ghq
    meld
    lazygit
    sourcegit
    smartgit
    gitkraken
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    settings.init.defaultBranch = "main";
    settings.user = {
      name = "Reticulmz";
      email = "36363244+Reticulmz@users.noreply.github.com";
      signingKey = "BB934CB30796D877";
    };
    settings.ghq = {
      root = "~/projects";
      user = "reticulmz";
    };
    settings.diff = {
      tool = "meld";
    };
    settings.gpg = {
      program = "gpg";
    };
    settings.commit = {
      gpgsign = true;
    };
  };
}
