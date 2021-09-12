{ pkgs, lib, ... } :
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    #enableSyntaxHighlighting = true;
    autocd = true;
    #defaultKeymap = "vicmd";
   # localVariables = {
   # # Override highlighter colors
   #   "ZSH_HIGHLIGHT_STYLES[unknown-token]" = "fg=red,bold";
   #   "ZSH_HIGHLIGHT_STYLES[path]" = "fg=blue,bold";
   #   "ZSH_HIGHLIGHT_STYLES[single-hyphen-option]" = "fg=yellow,bold";
   #   "ZSH_HIGHLIGHT_STYLES[double-hyphen-option]" = "fg=yellow,bold";
   #   "ZSH_HIGHLIGHT_STYLES[single-quoted-argument]" = "fg=cyan,bold";
   #   "ZSH_HIGHLIGHT_STYLES[double-quoted-argument]" = "fg=cyan,bold";
   #   "ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]" = "fg=cyan";
   #   "ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]" = "fg=cyan";
   #   "ZSH_HIGHLIGHT_STYLES[redirection]" = "fg=magenta";
   #   "ZSH_HIGHLIGHT_STYLES[commandseparator]" = "fg=magenta";
   #   "ZSH_HIGHLIGHT_STYLES[comment]" = "fg=239,bold";
   #   "ZSH_HIGHLIGHT_STYLES[cursor]" = "bg=blue";
   #   "ZSH_HIGHLIGHT_STYLES[line]" = "bold";
   # };
    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";
      plugins = [
        "colored-man-pages"
        "colorize"
        "common-aliases"
        "copyfile"
        "docker"
        "extract"
        "git"
        #"history-search-multi-word"
        "pip"
        "pipenv"
        "python"
      ];
    };
    plugins = [
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
      }
      {
        name = "powerlevel10k";
        src = pkgs.zsh-powerlevel10k;
        file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      }
    ];
    shellAliases = {
      df = "df -h";
      python = "python3.9";
      pip = "python -m pip";
    };
  };

  programs.broot = {
    enableZshIntegration = true;
    #modal = true;
  };
  
}
