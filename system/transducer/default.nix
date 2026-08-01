{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ../commons/boot.nix
      ../commons/bluetooth.nix
      ../commons/misc.nix
      ../commons/locale.nix
      ../commons/console.nix
      ../commons/sound.nix
      ../commons/nix-settings.nix
      ../commons/basic-programs.nix
      ../commons/graphics.nix
      ../commons/fonts.nix
    ];

  networking.hostName = "semigroup"; # Define your hostname.

  # Allow unfree packages (discord, steam)
  # nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
  #   "steam"
  #   "steam-unwrapped"
  #   "discord"
  #   "pcloud"
  # ];

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  users = {
    mutableUsers = false;
    users = {
      vincent = {
        isNormalUser = true;
        extraGroups = [ "wheel" "lp" "networkmanager" "scanner" ]; # can add "input"
        home = "/home/vincent";
        description = "Vincent Peth";
        hashedPasswordFile = "/home/vincent/.hashedPassword";
      };
    };
  };

  # environment.systemPackages = [pkgs.kanata];

  # programs.steam = {
  #   enable = true;
  #   remotePlay.openFirewall = true;
  #   dedicatedServer.openFirewall = true;
  # };

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "25.05"; # Did you read the comment?
}
