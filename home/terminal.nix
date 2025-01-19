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

      shellInit = 
        '' if test -z "$TMUX"
          exec tmux
            end'';
    };

  fzf = {
    enable = true;
    enableFishIntegration = true;
    tmux.shellIntegrationOptions = [ "--tmux right, 40%, 90%" ];
  };

  tmux = {
    enable = true;
    baseIndex = 1;
    clock24 = true;
    keyMode = "vi";
    historyLimit = 50000;
    aggressiveResize = true;
    shortcut = "a";
    escapeTime = 0;
    shell = "${pkgs.fish}/bin/fish";
    terminal = "screen-256color";

    extraConfig = ''
set-option -g status-interval 5
set-option -g automatic-rename on
set-option -g automatic-rename-format '#{b:pane_current_path}'

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
      bind-key H resize-pane -L 5
      bind-key J resize-pane -D 5
      bind-key K resize-pane -U 5
      bind-key L resize-pane -R 5
    '';
    
    plugins = with pkgs.tmuxPlugins; [
      extrakto # shift
      tmux-fzf # F
      tmux-thumbs #space
      fzf-tmux-url # I
      mode-indicator
      power-theme
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

if [[ -z "$TMUX" && $(${pkgs.procps}/bin/ps -o comm= $PPID) != "tmux" ]]; then
  exec tmux
fi

      '';
  };
  };
}
