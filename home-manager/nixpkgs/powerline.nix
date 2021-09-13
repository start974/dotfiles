{ pkgs, ... }:
{
  programs.powerline-go = {
    newline = true;

    pathAliases = {
      "\\~/dotfile/home-manager" = "cfg/home-manager";
    };

    # (valid choices: aws, bzr, cwd, docker, docker-context, dotenv, duration, exit, fossil, gcp, git, gitlite, goenv, hg, host, jobs, kube, load, newline, nix-shell, node, perlbrew, perms, plenv, rbenv, root, shell-var, shenv, ssh, svn, termtitle, terraform-workspace, time, user, venv, vgo, wsl)
    modules = [
      "user"

      "ssh"
      "docker"
      "venv"
      "nix-shell"

      "cwd"
      "git"
      "jobs"
      "time"
      "exit"
      "newline"
    ];
    settings = {
      shell = "zsh";
      cwd-max-depth = 4;
      cwd-mode = "semifancy";
      theme = "solarized-dark16";
    };
  };
}
