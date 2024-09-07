{ pkgs, config, ... }:

{
  home.packages = [ pkgs.alacritty-theme ];
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 10;
      cursor.style.shape = "Beam";
      
      window = {
        decorations = "none";
        blur = false;
        opacity = 1;
        padding.x = 15;
        padding.y = 0;
      };
      
      import = [
        "${pkgs.alacritty-theme}/catppuccin_mocha.toml"
      ];
    };
  };

  
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
