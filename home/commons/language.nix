{ pkgs, ... }:

{
  home = {
    language =
      let
        fr = "fr_FR.UTF-8";
        us = "en_US.UTF-8";
      in {
        base = us;
        measurement = fr;
        paper = fr;
        monetary = fr;
        time = fr;
        telephone = fr;
        address = fr;
      };
  };
}
