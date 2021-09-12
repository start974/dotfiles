{ pkgs, ... }:
{
    programs.git = {
        userName = "jeremy.damour";
        userEmail = "jeremy.damour2@gmail.com";
        aliases = {
            stat = "!git --no-pager diff --stat";
            # Clean merged branches
            lg = "log --graph --all --pretty=format:'%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)%an%Creset %C(yellow)%d%Creset'";

            # Checkout to master fast
            m = "checkout master";

            # Removes a file from the index
            unstage = "reset HEAD --";
          };
          ignores = [
            # Vim
            "*.swp"
          ];
          extraConfig = {
            core.editor = "vim";
            push.default = "current";
            pull.rebase = true;
            commit.verbose = true;
            remote.pushdefault = "origin";
            init.defaultBranch = "main";
            merge.tool = "vimdiff";
        };
    };
}
