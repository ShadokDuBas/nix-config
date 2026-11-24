{ pkgs, config, ... }:

{
  programs = {

    firefox = {
      enable = true;
      configPath = "${config.home.homeDirectory}/.config/mozilla/firefox";
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
