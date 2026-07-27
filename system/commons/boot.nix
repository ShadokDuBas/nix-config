{ config, lib, pkgs, ... }:

{ boot =
  {
    # Use the systemd-boot EFI boot loader.
    loader = {
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
      };
      efi.canTouchEfiVariables = true;
    };
    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
