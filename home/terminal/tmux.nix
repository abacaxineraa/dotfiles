{ pkgs, ... }:

{

  programs = {
    fzf = {
      enable = true;
      tmux = {
        enableShellIntegration = true;
        shellIntegrationOptions = [ "-d 35%" ];
      };
       defaultOptions = [
         "--height 40%"
           "--border"
    ];

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
      mouse = true;
      shell = "${pkgs.fish}/bin/fish";
      terminal = "screen-256color";

      extraConfig = ''
        set -g status off
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
        tmux-fzf
        vim-tmux-navigator
        {
          plugin = yank;
          extraConfig = "set -g @yank_selection_mouse 'clipboard'";
        }
        {
          plugin = extrakto; # tab
          extraConfig = ''
            set -g @extrakto_popup_size '40%, 90%'
            set -g @extrakto_popup_position 'R,C'
            set -g @extrakto_filter_order 'line word all'
          '';
        }
      ];
    };
  };
}
