{ pkgs, ... }:
{
  programs.vscode = {
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      vscodevim.vim
      yzhang.markdown-all-in-one
      ocamllabs.ocaml-platform
    ];
    userSettings = {
      "editor.fontFamily" = "'FiraCode Nerd Font'";
      "editor.fontLigatures" = true;
      "editor.fontSize" = 15;
      "files.autoSave" = "onWindowChange";
      "workbench.preferredDarkColorTheme" = "Monokay";
    };
  };
}
