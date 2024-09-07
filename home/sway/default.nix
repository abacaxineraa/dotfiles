{ pkgs, ... }:

let
  mod = "Mod4";
in
{
  
  
  home.packages = with pkgs; [
    grim
    slurp
    swaylock
    swayidle
    wl-clipboard
    mako
    alacritty
  ];


  programs.wofi = {
    enable = true;
    settings = {
      allow_markup = true;
      width = 250;
    };
  };
  
  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    systemd.enable = true;
    
    config = {
      modifier = mod;
      terminal = "alacritty"; 
      startup = [
        {command = "alacritty";}
      ];
      menu = "wofi --show run";
      
      bars = [{
        fonts.size = 15.0;
        command = "waybar";
        position = "bottom";
      }];          

      
      # keybindings = lib.attrsets.mergeAttrsList [
      #   (lib.attrsets.mergeAttrsList (map (num: let
      #     ws = toString num;
      #   in {
      #     "${mod}+${ws}" = "workspace ${ws}";
      #     "${mod}+Ctrl+${ws}" = "move container to workspace ${ws}";
      #   }) [1 2 3 4 5 6 7 8 9 0]))

      #   (lib.attrsets.concatMapAttrs (key: direction: {
      #     "${mod}+${key}" = "focus ${direction}";
      #     "${mod}+Ctrl+${key}" = "move ${direction}";
      #   }) {
      #     h = "left";
      #     j = "down";
      #     k = "up";
      #     l = "right";
      #   })

      #   {
      #     "${mod}+Return" = "exec --no-startup-id ${pkgs.kitty}/bin/kitty";
      #     "${mod}+space" = "exec --no-startup-id wofi --show drun,run";

      #     "${mod}+x" = "kill";

      #     "${mod}+a" = "focus parent";
      #     "${mod}+e" = "layout toggle split";
      #     "${mod}+f" = "fullscreen toggle";
      #     "${mod}+g" = "split h";
      #     "${mod}+s" = "layout stacking";
      #     "${mod}+v" = "split v";
      #     "${mod}+w" = "layout tabbed";

      #     "${mod}+Shift+r" = "exec swaymsg reload";
      #     "--release Print" = "exec --no-startup-id ${pkgs.sway-contrib.grimshot}/bin/grimshot copy area";
      #     "${mod}+Ctrl+l" = "exec ${pkgs.swaylock-fancy}/bin/swaylock-fancy";
      #     "${mod}+Ctrl+q" = "exit";
      #   }
      # ];
      
      focus.followMouse = true;
      workspaceAutoBackAndForth = true;
    };
  };

  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };


  services.cliphist.enable = true;

  services.kanshi = {
    enable = true;

    # profiles = {
    #   home_office = {
    #     outputs = [
    #       {
    #         criteria = "DP-2";
    #         scale = 2.0;
    #         status = "enable";
    #         position = "0,0";
    #       }
    #       {
    #         criteria = "DP-1";
    #         scale = 2.0;
    #         status = "enable";
    #         position = "1920,0";
    #       }
    #       {
    #         criteria = "DP-3";
    #         scale = 2.0;
    #         status = "enable";
    #         position = "3840,0";
    #       }
    #     ];
    #   };
    # };
  };


  wayland.windowManager.sway.extraOptions = [ "--unsupported-gpu" ];
  home.sessionVariables = {
    XWAYLAND_NO_GLAMOR = "1";
    XDG_SESSION_TYPE = "wayland";
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm"; # remove if issue w ff
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_RENDERER = "vulkan";
    # xdg
    # XDG_CACHE_HOME = "${h}/.cache";
    # XDG_CONFIG_HOME = "${h}/.config";
    # XDG_DATA_HOME = "${h}/.local/share";
    # XDG_STATE_HOME = "${h}/.local/state";
    # misc
    MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    MANROFFOPT = "-c";

    
    # EDITOR = "emacs";
    # idk wtf this is
    # MOZ_ENABLE_WAYLAND = "1";
    # WLR_BACKEND = "vulkan";
    # CLUTTER_BACKEND = "wayland";

    MOZ_ENABLE_WAYLAND=1;
    NIXOS_OZONE_WL=1; # Electron
  };

}


  # exec sleep 5; systemctl --user start kanshi.service

  # # Brightness
  # bindsym XF86MonBrightnessDown exec light -U 10
  # bindsym XF86MonBrightnessUp exec light -A 10

  # # Volume
  # bindsym XF86AudioRaiseVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ +1%'
  # bindsym XF86AudioLowerVolume exec 'pactl set-sink-volume @DEFAULT_SINK@ -1%'
  # bindsym XF86AudioMute exec 'pactl set-sink-mute @DEFAULT_SINK@ toggle'


  


  # https://shen.hong.io/nixos-home-manager-wayland-sway/
  # https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.sway.config
  # https://github.com/smravec/nixos-config/blob/f32f40ad80b38222493df36b4e59d79484e44def/nixos/wayland/window-manager.nix#L37
  # https://github.com/smravec/nixos-config
