{ lib
, config
, pkgs
, inputs
, ... }:

let
  wallpaper = "file://${../../assets/wallpaper.png}";
  
in
{
  # https://shen.hong.io/nixos-home-manager-wayland-sway/
  # https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.sway.config
  # https://github.com/smravec/nixos-config/blob/f32f40ad80b38222493df36b4e59d79484e44def/nixos/wayland/window-manager.nix#L37
  # https://github.com/smravec/nixos-config
  
  wayland.windowManager.sway = {
    enable = true;
    extraConfig = ''
      for_window [title="Menu"] floating enable
    '';
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
        };

        "type:mouse" = {
          natural_scroll = "enabled";
        };
      };
      
      window.hideEdgeBorders = "both";
      fonts = {
        names = [ "FiraCode Nerd Font" ];
        style = "Regular";
        size = 10.0;
      };

      startup = [
        { command = "firefox-devedition"; }
      ];
    };
  };
}


