{ config, lib, pkgs, ... }:

{
  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
  # Configure keymap in X11
    xkb.layout = "fr";
    xkb.options = "caps:swapescape";
  };

  # Enable the GNOME Desktop Environment.
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;
  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
  };
  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard
    slurp
    xwayland-satellite
  ];
}
