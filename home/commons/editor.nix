{ pkgs, ... }:

{
  programs = {

    # needed so that nvim-treesitter can compile parsers
    gcc = {
      enable = true;
      colors = {error = "01;31";};
    };

    ripgrep.enable = true;

  };
}
