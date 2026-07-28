{ pkgs, ... }:

{
  programs = {

    fzf = {
      enable = true;
      enableFishIntegration = true;
      historyWidget.command = "";
    };

    bat.enable = true;

    yazi = {
      enable = true;
      settings = {
        mgr = {
          show_hidden = true;
        };
      };
      shellWrapperName = "y";
    };
  };
  
  home.packages = with pkgs;
    [
      qrencode
      tldr
      moreutils
      gum
      tree
    ];
}
