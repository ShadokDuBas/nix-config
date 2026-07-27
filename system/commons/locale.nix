{ config, lib, pkgs, ... }:

{
  # Set your time zone.
  time.timeZone = "Europe/Paris";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings =
      let
        fr = "fr_FR.UTF-8";
        us = "en_US.UTF-8";
      in {
        LC_TIME="fr_FR.UTF-8";
        LC_MONETARY="fr_FR.UTF-8";
        LC_PAPER="fr_FR.UTF-8";
        LC_ADDRESS="fr_FR.UTF-8";
        LC_TELEPHONE="fr_FR.UTF-8";
        LC_MEASUREMENT="fr_FR.UTF-8";
      };
  };
}
