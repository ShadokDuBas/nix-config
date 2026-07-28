{ pkgs, ... }:

{
  imports =
    [
      ../commons/language.nix
      ../commons/misc.nix
      ../commons/editor.nix
      ../commons/shells.nix
      ../commons/git.nix
      ../commons/scripting.nix
      ../commons/basic-programs.nix
      ../commons/graphics.nix
      # ../commons/mail.nix
      # ../commons/games.nix
      # ../commons/science.nix
      # ../commons/code.nix
      # ../commons/office.nix
    ];

  home.stateVersion = "25.11"; # Never change this
}
