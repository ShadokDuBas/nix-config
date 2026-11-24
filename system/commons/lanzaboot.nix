{ config, lib, pkgs, ... }:

{ boot =
  {
    # Use the systemd-boot EFI boot loader.
    loader = {
      grub = {
        # enable = true;
        efiSupport = true;
        device = "nodev";
        configurationLimit = 30;
      };
      systemd-boot = {
        # enable = true;
        configurationLimit = 4;
        };
      efi.canTouchEfiVariables = true;
    };
    lanzaboote = {
      enable = true;
      pkiBundle = "/var/lib/sbctl";
      autoGenerateKeys.enable = true;
      autoEnrollKeys = {
        enable = true;
        autoReboot = true;
      };
      configurationLimit = 4;
      measuredBoot = {
        enable = true;
        pcrs = [ 0 4 7 ];
      };
    };
    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
