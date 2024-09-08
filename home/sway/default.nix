{ lib
, config
, pkgs
, inputs
, ... }:

let
  inherit (lib) mkIf;
  inherit (lib.attrsets) optionalAttrs;
  inherit (lib.lists) optionals;
  inherit (lib.strings) optionalString;

  output-config = (import ./monitors.nix {
    inherit lib;
    inherit (config) monitors;
  });

  cursor-size = 24;
  
  # background-image = config.wallpaper;
  # lock-cmd = "${config.programs.swaylock.package}/bin/swaylock -S --daemonize";

  # color-config = with config.colorScheme.palette; ''
  #   # class                 border     backgr.    text       indicator    child_border
  #   client.focused          #${base04} #${base0D} #${base02} #${base0E}   #${base0D}
  #   client.focused_inactive #${base02} #${base02} #${base06} #${base0E}   #${base0E}
  #   client.unfocused        #${base02} #${base01} #${base07} #${base04}   #${base04}
  #   client.urgent           #${base0A} #${base09} #${base01} #${base04}   #${base0A}
  #   client.placeholder      #${base00} #${base04} #${base07} #${base00}   #${base04}

  #   client.background       #${base00}
  # '';

in
{
  imports = [
    ./waybar.nix
    ./keybindings.nix
    ./programs.nix
    # ../wayland
  ];

  home.packages = builtins.attrValues {
    inherit (pkgs) wl-clipboard albert;
  };


  wayland.windowManager.sway = {
    enable = true;
    extraConfig = ''
      for_window [title="Menu"] floating enable
    '';
    wrapperFeatures.gtk = true;
   # systemd.enable = true;

    config = {
      # bars = [
      #   {
      #     position = "bottom";
      #     command = "waybar";
      #   }
      # ];

      focus.followMouse = true;
      workspaceAutoBackAndForth = true;


      input = {
        "type:pointer" = { 
          natural_scroll = "enabled";
        };

        "type:touchpad" = { 
          natural_scroll = "enabled";
        };

        "type:mouse" = {
          natural_scroll = "enabled";
        };
      };
      
      # output = output-config // {
      #   "*" = {
      #     bg = "${background-image} fill";
      #   };
      # };
      
      window.hideEdgeBorders = "both";
      fonts = {
        names = [ "FiraCode Nerd Font" ];
        style = "Regular";
        size = 12.0;
      };

      startup = [
        { command = "firefox-devedition"; }
        { command = "${pkgs.albert}/bin/albert"; }
      ];

      # set cursor size
      seat."*".xcursor_theme = "Numix ${builtins.toString cursor-size}";
    };

    systemd.enable = true;

   # extraConfig = color-config;

    extraSessionCommands = ''
        export QT_AUTO_SCREN_SCALING_FACTOR=1 
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOW_DECORATIONS=1
        export GDK_BACKEND=wayland
        export MOZ_ENABLE_WAYLAND=1
        export XDG_SESSION_TYPE=wayland
        export XDG_SESSION_DESKTOP=sway
        export XDG_CURRENT_DESKTOP=sway
        export _JAVA_AWT_WM_NONREPARENTING=1
      '';
  };


  home.pointerCursor = {
    package = pkgs.numix-cursor-theme;
    name = "Numix";
    size = cursor-size;
    gtk.enable = true;
  };
}

  # https://shen.hong.io/nixos-home-manager-wayland-sway/
  # https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.sway.config
  # https://github.com/smravec/nixos-config/blob/f32f40ad80b38222493df36b4e59d79484e44def/nixos/wayland/window-manager.nix#L37
  # https://github.com/smravec/nixos-config
