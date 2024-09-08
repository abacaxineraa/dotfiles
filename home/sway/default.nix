{ pkgs, ... }:

let
  mod = "Mod4";
in
{
  imports = [
    ./waybar.nix
    ./keybindings.nix
    ./programs.nix
  ];

  wayland.windowManager.sway = {
    enable = true;
    extraConfig = ''
      for_window [title="Menu"] floating enable
    '';
    wrapperFeatures.gtk = true;
    systemd.enable = true;
  };

  wayland.windowManager.sway.config = rec {
    # bars = [
    #   {
    #     position = "bottom";
    #     command = "waybar";
    #   }
    # ];

    focus.followMouse = true;
    workspaceAutoBackAndForth = true;

    startup = [ { command = "firefox-devedition"; } ];

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
  };
}

  # https://shen.hong.io/nixos-home-manager-wayland-sway/
  # https://nix-community.github.io/home-manager/options.xhtml#opt-wayland.windowManager.sway.config
  # https://github.com/smravec/nixos-config/blob/f32f40ad80b38222493df36b4e59d79484e44def/nixos/wayland/window-manager.nix#L37
  # https://github.com/smravec/nixos-config
