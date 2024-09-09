{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

let
  wallpaper = "file://${../../assets/wallpaper.png}";
in
{
  wayland.windowManager.sway = {
    enable = true;
    extraConfig = ''
      for_window [title="Menu"] floating enable  '';
    wrapperFeatures.gtk = true;
    systemd.enable = true;

    
    config = {
      bars = [ ];

      focus.followMouse = true;
      workspaceAutoBackAndForth = true;

      input = {
        "type:pointer" = {
          natural_scroll = "enabled";
        };

        "type:touchpad" = {
          natural_scroll = "enabled";
          drag = "enabled";
          dwt = "enabled";
          tap = "enabled";
          click_method = "clickfinger";
        };

        "type:mouse" = {
          natural_scroll = "enabled";
        };
      };

      colors = let borderActive = "#101010"; borderInactive = "#000000"; in {
        "focused" = { border = borderActive; background = borderActive; text = "#404040"; indicator = "#ffffff"; childBorder = borderActive; };
        "unfocused" = { border = borderInactive; background = borderInactive; text = "#202020"; indicator = "#ffffff"; childBorder = borderInactive; };
      };
 
      window.hideEdgeBorders = "smart";
      window.border = 4;
      window.titlebar = false;
      window.commands = [
        # { criteria = { app_id = "mpv"; }; command = "sticky enable"; }
        # { criteria = { app_id = "mpv"; }; command = "floating enable"; }
        {
          criteria = {
            title = "^(.*) Indicator";
          };
          command = "floating enable";
        }
        {
          criteria = {
            title = "Picture-in-Picture"; # Firefox
          };
          command = "floating enable";
        }
      ];   

      startup = [ { command = "firefox-devedition"; } ];

      # output = {
      #   "*" =
      #     "${out_aw25}" = {
      #       scale = "1.0";
      #       mode = "1920x1080@240Hz";
      #       adaptive_sync = "enable";
      #       subpixel = "rgb";
      #       render_bit_depth = "10";
      #     };
      # };
      
    };
  };
}
