{ pkgs, ... }:

{

  services.gammastep = {
    enable = true;
    temperature = {
      day = 3800;
      night = 3500;
    };
    dawnTime = "6:00-7:45";
    duskTime = "16:00-17:45";
  };

  programs = {

    wofi.enable = true;

    waybar.enable = true;

  };

  home.packages = with pkgs; 
    [ 
      gnome-tweaks
      swayimg
      swaybg
      wlr-which-key
    ]
}
