{ pkgs, lib, ... } :
{
  programs.zsh = {
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    autocd = true;
    #defaultKeymap = "vicmd";
    localVariables = {
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
   };
    oh-my-zsh = {
      enable = true;
      theme = "fino"; #"bira";
      plugins = [
        "colored-man-pages"
        "colorize"
        "common-aliases"
        "copyfile"
        "docker"
        "extract"
        "git"
        "pip"
        "pipenv"
        "python"
      ];
    };
    shellAliases = {
      df = "df -h";
      python = "python3.9";
      pip = "python -m pip";
    };
  };

  programs = {
    broot.enableZshIntegration = true;
    mcfly = {
      enableZshIntegration = true;
      enableLightTheme = true;
      enableFuzzySearch = true;
    };
    opam.enableZshIntegration = true;
  };
}
