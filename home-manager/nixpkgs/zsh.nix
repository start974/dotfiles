{ pkgs, lib, ... } :
let
  exclude_dir = ".git,.gitlab,.idea,.vscode";
  bin = {
    bat       = "${pkgs.bat}/bin/bat";
    bottom    = "${pkgs.bottom}/bin/btm";
    delta     = "${pkgs.delta}/bin/delta";
    dua       = "${pkgs.dua}/bin/dua";
    eva       = "${pkgs.eva}/bin/eva";
    fd        = "${pkgs.fd}/bin/fd";
    rg        = "${pkgs.ripgrep}/bin/rg";
    trash-put = "${pkgs.trash-cli}/bin/trash-put";
    xsel      = "${pkgs.xsel}/bin/xsel";
  };
  clip = "${bin.xsel} --output --clipboard";
in
  {
    home.packages = with pkgs; [
      bat
      bottom
      delta
      dua
      eva
      fd
      ripgrep
      trash-cli
      xsel
    ];
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
   "dl"  = "$HOME/Downloads";
   "db"  = "$HOME/Dropbox";
   "dot" = "$HOME/dotfiles";
   };
   shellAliases = {
      # builtin replacement
      cat   = "${bin.bat}";
      rm    = "${bin.trash-put}";
      top   = "${bin.bottom}";
      diff  = "${bin.delta}";
      du    = "${bin.dua} i";
      find  = "${bin.fd}";
      grep  = "${bin.rg}";
      calc  = "${bin.eva}";

      e     = "$EDITOR";
      config = "
        cd ~/dotfiles/home-manager/nixpkgs/ \\
        && $EDITOR .                        \\
        && home-manager switch
      ";
      frmac = "setxkbmap fr -variant mac";
      make = "make -j`nproc`";
      wgetclip = "wget $(${clip})";
      gcloneclip = "git clone $(${clip})";
      cdtmp = "cd $(mktemp -d)";
      rgrep = "grep --iglob={${exclude_dir}}";
      pathln = "echo $PATH | tr ':' '\n'";

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
