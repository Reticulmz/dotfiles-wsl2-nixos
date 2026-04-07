{ pkgs, ... }:

{
  home.packages = with pkgs; [
    fzf
    zsh-fzf-tab
    zsh-completions
    zoxide
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    history.size = 1000;
    history.path = "$HOME/.zsh_history";
    history.ignoreAllDups = true;
    initContent = ''
      eval "$(zoxide init zsh --cmd cd)"
    '';
    plugins = [
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
      {
        name = "fzf-tab";
        src = pkgs.zsh-fzf-tab;
        file = "share/fzf-tab/fzf-tab.plugin.zsh";
      }
      {
        name = "powerlevel10k-config";
        src = ./.;
        file = "p10k.zsh";
      }
    ];
  };
  programs.zsh.zsh-abbr = {
    enable = true;
    abbreviations = {
      cc = "claude";
    };
  };
}
