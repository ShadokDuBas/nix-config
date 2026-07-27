{ pkgs, ... }:

{
  
  programs.aerc.enable = true;

  home.packages = with pkgs; 
    [
      neomutt
      mutt-wizard
      isync
      msmtp
      pass-wayland
      abook
      lynx
      notmuch
    ];
}
