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
    plugins = [
      {
        name = "zsh-nix-shell";
        file = "nix-shell.plugin.zsh";
        src = pkgs.fetchFromGitHub {
          owner = "chisui";
          repo = "zsh-nix-shell";
          rev = "v0.4.0";
          sha256 = "037wz9fqmx0ngcwl9az55fgkipb745rymznxnssr3rx9irb6apzg";
        };
      }
    ];
    shellAliases = {
      df = "df -h";
      config = "cd ~/dotfiles/home-manager/nixpkgs/ \\
                && vim .                            \\
                && home-manager switch";
      frmac = "setxkbmap fr -variant mac";
      make = "make -j`nproc`";
      rm = "trash-put";
      cat = "bat";
      #python = "python3";
      #pip = "python -m pip";
    };
  };

  programs = {
    broot.enableZshIntegration = true;

    mcfly = {
      enableZshIntegration = true;
      enableLightTheme = false;
      enableFuzzySearch = true;
    };

    opam.enableZshIntegration = true;
  };
}
