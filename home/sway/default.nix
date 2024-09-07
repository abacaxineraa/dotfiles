{ pkgs, ... }:

let
  mod = "Mod4";
in
{
  imports = [
    ./waybar.nix
  ];
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

  # nvidia
  wayland.windowManager.sway.extraOptions = [ "--unsupported-gpu" ];
  
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
    #     ];
    #   };
    # };
  };  
}

  # https://shen.hong.io/nixos-home-manager-wayland-sway/
  # https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.sway.config
  # https://github.com/smravec/nixos-config/blob/f32f40ad80b38222493df36b4e59d79484e44def/nixos/wayland/window-manager.nix#L37
  # https://github.com/smravec/nixos-config
