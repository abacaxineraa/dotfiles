{ pkgs, ... }:

{
  home.packages = with pkgs; [
    swaylock
    swayidle
    wl-clipboard
    mako
    alacritty
    wofi
    waybar
  ];

  wayland.windowManager.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    config = rec {
      modifier = "Mod4";
      terminal = "alacritty"; 
      startup = [
        {command = "alacritty";}
      ];
      menu = "wofi --show run";
      
      bars = [{
        fonts.size = 15.0;
        # command = "waybar"; You can change it if you want
        position = "bottom";
      }];          
    };
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


  

  # Set WLR_RENDERER=vulkan (If not, the screen flickers)

  #   Set WLR_NO_HARDWARE_CURSORS=1 (If not, you can’t see your cursors)

  #     Set XWAYLAND_NO_GLAMOR=1 (If not, windows under XWayland flicker)

  #       Disable “Hardware Acceleration” setting in Discord (If not, the Discord window will be blank)


  # https://shen.hong.io/nixos-home-manager-wayland-sway/
  # https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.sway.config
  # https://github.com/smravec/nixos-config/blob/f32f40ad80b38222493df36b4e59d79484e44def/nixos/wayland/window-manager.nix#L37
  # https://github.com/smravec/nixos-config
