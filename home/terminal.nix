{ pkgs, config, ... }:

{
  programs = {
    fish = {
      enable = true;
      shellAliases = {
        cat = "${pkgs.bat}/bin/bat";
        ls = "${pkgs.eza}/bin/eza";
      };
      functions = {
        fish_greeting = "${pkgs.fortune}/bin/fortune | ${pkgs.cowsay}/bin/cowsay";
      };
    };

    starship = {
      enable = true;
      enableTransience = true;
      enableBashIntegration = false;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    bash = {
      enable = true;
      initExtra = ''
        if [[ $(${pkgs.procps}/bin/ps -o comm= $PPID) != "fish" && -z "$BASH_EXECUTION_STRING" ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${config.programs.fish.package}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };
}
