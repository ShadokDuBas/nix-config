{ pkgs, ... }:

{
  programs = {

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

    bash = {
      enable = true;
      # make fish the default shell
      initExtra = ''
      if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
          fi
      '';
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

  };
}
