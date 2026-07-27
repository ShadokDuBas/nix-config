{ pkgs, ... }:

{
  programs = {

    sioyek = {
      enable = true;
      config = {
        "ruler_display_mode" = "slit";
        "should_launch_new_window" = "1";
      };
    };

  };

  home.packages = with pkgs; 
    [
      texliveFull
      aspell
      aspellDicts.en
      aspellDicts.fr
      poppler-utils # pdfunite / separate
      pandoc
      zotero
      typst
    ];
}
