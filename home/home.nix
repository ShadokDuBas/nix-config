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
  };
  
  manual.html.enable = true;


  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  # needed so that nvim-treesitter can compile parsers
  programs.gcc = {
    enable = true;
    colors = {error = "01;31";};
  };

  programs.firefox.enable = true;

  programs.ripgrep.enable = true;

  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
    };
  };

  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # disable greeting
      '';
  };

  # make fish the default shell
  programs.bash = {
    enable= true;
    initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
          fi
    '';
  };

  programs.git = {
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

  programs.alacritty = {
    enable = true;
    theme = "kanagawa_dragon";
    settings.font.size = 14;
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

  programs.bat.enable = true;

  programs.wofi.enable = true;

  services.gammastep = {
    enable = true;
    temperature = {
      day = 3800;
      night = 3500;
    };
    dawnTime = "6:00-7:45";
    duskTime = "16:00-17:45";
  };

  programs.waybar.enable = true;

  programs.yazi = {
    enable = true;
    settings = {
      mgr = {
        show_hidden = true;
      };
    };
  };

  programs.sioyek = {
    enable = true;
    config = {
      "ruler_display_mode" = "slit";
      "should_launch_new_window" = "1";
    };
  };

  # programs.gpg.enable = true; # -> configuration.nix

  home.packages = with pkgs; 
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
      fzf
      vlc
      wlr-which-key
      hledger
    ];

  news.display = "silent";
}
