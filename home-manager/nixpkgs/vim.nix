{ pkgs, ... } : 
{
    programs.vim = {
        enable = true;
        extraConfig = (builtins.readFile ../vim/vimrc);
    };
}
