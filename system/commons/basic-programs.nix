{ config, lib, pkgs, ... }:

{
  programs = {
    firefox.enable = true;
    git.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    gnupg.agent.enable = true;
  };

  services.openssh.enable = true;

  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    btop
    gnumake
    xwayland-satellite
  ];
}
