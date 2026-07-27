{ pkgs, ... }:

{
  programs = {

    firefox = {
      enable = true;
      configPath = "$HOME/.config/mozilla/firefox";
    };

    alacritty = {
      enable = true;
      theme = "kanagawa_dragon";
      settings.font = {
        size = 14;
        normal.family = "FiraCode Nerd Font";
      };
    };

  };
}
