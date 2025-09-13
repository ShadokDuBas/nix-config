# TODO: add skim or fzf
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
    userName = "Vincent";
    userEmail = "vincent.peth@free.fr";
    aliases = {
      graph = "log --graph --oneline --decorate --all";
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
    extraConfig = {
      init={
        defaultBranch = "main";
      };
      core.editor="nvim";
    };
  };

  programs.alacritty = {
    enable = true;
    theme = "kanagawa_dragon";
  };

  programs.atuin = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
  };

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

  home.packages = with pkgs; 
    [ gnome-tweaks
      texliveFull
      discord
      qrencode
      swayimg
      swaybg
      pcloud
      keepassxc
    ];

  news.display = "silent";
}
