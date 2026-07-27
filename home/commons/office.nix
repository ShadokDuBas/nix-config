{ pkgs, ... }:

{

  home.packages = with pkgs; 
    [
      pcloud
      keepassxc
      vlc
      hledger
    ];
}
