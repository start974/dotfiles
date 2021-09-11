:##################################################
# Maintainer:
# JDam "start974"
# <jeremy.damour2@gmail.com>
#
# Acknowledgements:
#   Several elements of this .vimrc come from:
#   Kévin "Chewie" Sztern
#   You can find it here:
#   https://github.com/Chewie/dotfiles/blob/master/vim/.vimrc
#
##################################################

{ pkgs, ... } : 
{
    programs.vim = {
        enable = true;
        extraConfig = (builtins.readFile ~/.config/vim/vimrc);
    };
}
