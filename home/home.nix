# TODO: mettre les trucs comme cargo et ocaml dans des profils
{pkgs, ...} :

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

    # commented out : I want to have the qwerty codes for sway
    # keyboard = {
    #   layout = "fr";
    #   variant = "ergol";
    #   options = [ "caps:swapescape" ];
    # };

    # sessionVariables = {
    #   EDITOR = "nvim";
    # };
    stateVersion = "25.11"; # Never change this
    # shell = {
    #   enableFishIntegration = true;
    #   enableNushellIntegration = true;
    # };
  };
  
  manual.html.enable = true;


  programs = {
  # moved to configuration to avoid conflict with my config
  # neovim = {
  #   enable = true;
  #   defaultEditor = true;
  # };

  # needed so that nvim-treesitter can compile parsers
  gcc = {
    enable = true;
    colors = {error = "01;31";};
  };

  firefox.enable = true;

  ripgrep.enable = true;

  nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };
  };

  fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # disable greeting
      '';
  };

  # make fish the default shell
  bash = {
    enable = true;
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
          fi
    '';
  };

  fzf = {
    enable = true;
    enableFishIntegration = true;
  };

  git = {
    enable = true;
    settings = {
      alias = {
        graph = "log --graph --oneline --decorate --all";
      };
      user = {
        name = "Vincent Peth";
        email = "vincent.peth@free.fr";
      };
      core.editor="nvim";
      init.defaultBranch = "main";
      pull.rebase = "false";
    };
    ignores = [
      "*~"
      "*.swp"
      "*.log"
      "*.aux"
      "*.out"
      "*.toc"
      "*.bbl"
      "*.blg"
      "target/"
    ];
  };

  alacritty = {
    enable = true;
    theme = "kanagawa_dragon";
    settings.font = {
        size = 14;
        normal.family = "FiraCode Nerd Font";
    };
  };

  atuin = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  bat.enable = true;

  wofi.enable = true;

  waybar.enable = true;

  yazi = {
    enable = true;
    settings = {
      mgr = {
        show_hidden = true;
      };
    };
  };

  sioyek = {
    enable = true;
    config = {
      "ruler_display_mode" = "slit";
      "should_launch_new_window" = "1";
    };
  };

  aerc.enable = true;

  # gpg.enable = true; # -> configuration.nix
  };

  services.gammastep = {
    enable = true;
    temperature = {
      day = 3800;
      night = 3500;
    };
    dawnTime = "6:00-7:45";
    duskTime = "16:00-17:45";
  };


  home.packages =
    let mycoq = pkgs.coq.withPackages (ps: with ps; [ equations stdlib metarocq
      ]); in
    with pkgs; 
    [ gnome-tweaks
      texliveFull
      discord
      qrencode
      swayimg
      swaybg
      pcloud
      keepassxc
      tldr
      neomutt
      mutt-wizard
      isync
      msmtp
      pass-wayland
      abook
      lynx
      notmuch
      moreutils
      gum
      vlc
      wlr-which-key
      hledger
      aspell
      aspellDicts.en
      aspellDicts.fr
      poppler-utils # pdfunite / separate
      pandoc
      mycoq
      mycoq.ocamlPackages.findlib 
      zotero
      typst
    ];

  news.display = "silent";
}
