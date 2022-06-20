{ pkgs, lib, ... } :
let
  clip = "xsel --output --clipboard";
  btm = "${pkgs.bottom}/bin/btm";
  dl_dir = "$HOME/Downloads";
  exclude_dir = ".git,.gitlab,.idea,.vscode";
in
{
  programs.zsh = {
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    enableAutosuggestions = true;
    enableVteIntegration = true;
    autocd = true;
    history = {
      save = 50000;
      size = 50000;
    };
    initExtra = ''
    # lauch tmux
      [ -z "$TMUX"  ] && { exec tmux new-session && exit;}
    '';
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
        "common-aliases"
        "copyfile"
        "docker"
        "extract"
        "git"
        "gitignore"
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
    dirHashes = {
      "dl" = "${dl_dir}";
      "db" = "$HOME/Dropbox";
      "dot" = "$HOME/dotfiles";
    };
    shellAliases = {
      df = "df -h";
      config = "cd ~/dotfiles/home-manager/nixpkgs/ \\
                && vim .                            \\
                && home-manager switch";
      frmac = "setxkbmap fr -variant mac";
      make = "make -j`nproc`";
      rm = "trash-put";
      cat = "bat";
      wgetclip = "wget $(${clip})";
      gcloneclip = "git clone $(${clip})";
      top = "${btm}";
      cdtmp = "cd $(mktemp -d)";
      rgrep = "grep -Rin --color=auto --exclude-dir={${exclude_dir}}";
      pathln = "echo $PATH | tr ';' '\n'";

      # sufflix alias
      "-s pdf" = "evince";
      "-s html" = "firefox";
      "-s py" = "python";
    };
  };

  programs = {
    broot.enableZshIntegration = true;

    direnv = {
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    mcfly = {
      enableZshIntegration = true;
      enableLightTheme = false;
      enableFuzzySearch = true;
    };

    opam.enableZshIntegration = true;
  };
}
