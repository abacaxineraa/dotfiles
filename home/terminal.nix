{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    alacritty-theme
    roboto-mono
  ];
  
  programs={
    alacritty = {
      enable = true;

      settings = {
        font = {
          normal.family = "Roboto Mono";
          size = 10;
        };

        cursor.style.shape = "Beam";

        window = {
          blur = false;
          opacity = 1;
          padding.x = 10;
          padding.y = 10;
        };

        general.import = [ "${pkgs.alacritty-theme}/horizon_dark.toml" ];
      };
  };

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

    fzf = {
      enable = true;
      enableFishIntegration = true;
      tmux.shellIntegrationOptions = [ "-d 40%" ];
    };

    tmux = {
       enable = true;
        baseIndex = 1;
         clock24 = true;
         keyMode = "vi";
         historyLimit = 50000;
         aggressiveResize = true;
         escapeTime = 0;
         shell = "${pkgs.fish}/bin/fish";
         terminal = "screen-256color";

         plugins = with pkgs.tmuxPlugins; [
         ];
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
