{ pkgs, ... }:

{
  programs.git = {
      enable = true;
      settings = {
        alias = {
          graph = "log --graph --oneline --decorate --all";
        };
        user = {
          name = "Vincent Peth";
          email = "vincent.peth@free.fr";
        };
        core.editor="nvim";
        init.defaultBranch = "main";
        pull.rebase = "false";
      };
      ignores = [
        "*~"
        "*.swp"
        "*.log"
        "*.aux"
        "*.out"
        "*.toc"
        "*.bbl"
        "*.blg"
        "target/"
      ];
    };
}
