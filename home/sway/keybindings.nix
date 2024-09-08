{
  config,
  pkgs,
  lib,
  ...
}:

{
  wayland.windowManager.sway = {
    enable = true;
    extraConfig = ''
      for_window [title="Menu"] floating enable
    '';
    wrapperFeatures.gtk = true;
    systemd.enable = true;
  };

  wayland.windowManager.sway.config = rec {
    bars = [
      {
        position = "bottom";
        command = "waybar";
      }
    ];

    focus.followMouse = true;
    workspaceAutoBackAndForth = true;

    startup = [ { command = "firefox-devedition"; } ];

    input."type:keyboard" = lib.mkForce {
      xkb_layout = "us";
      xkb_variant = "altgr-intl";
      xkb_options = "ctrl:nocaps";
    };

    modifier = "Mod4";
    floating.modifier = modifier;
    menu = "wofi --showrun";
    terminal = "alacritty";

    keybindings =
      let
        _lock = pkgs.writeShellScriptBin "_lock" ''
          ${pkgs.sway}/bin/swaymsg mode default
          ${pkgs.swaylock}/bin/swaylock -f
          systemctl --user start swayidle.service
        '';
        _suspend = pkgs.writeShellScriptBin "_suspend" ''
          ${pkgs.sway}/bin/swaymsg mode default
          systemctl --user start swayidle.service
          systemctl suspend
        '';
      in
        lib.mkOptionDefault {
          XF86AudioRaiseVolume = "exec volumesh -i 10";
          XF86AudioLowerVolume = "exec volumesh -d 10";
          XF86AudioMute = "exec volumesh -t";
          XF86AudioMicMute = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
          XF86AudioPlay = "exec playerctl play-pause";
          XF86AudioPause = "exec playerctl play-pause";
          XF86AudioNext = "exec playerctl next";
          XF86AudioPrev = "exec playerctl previous";

          "--locked Ctrl+${modifier}+z" = "exec ${_suspend}/bin/_suspend";
          "Print" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bi/slurp)\" - | wl-copy'";
          "Shift+Print" = "exec ${pkgs.grim}/bin/grim - | wl-copy'";

          "${modifier}+f" = "exec ${pkgs.firefox-devedition}/bin/firefox-devedition";
          "${modifier}+s" = "exec ${menu}";
          "${modifier}+e" = "exec emacsclient -c";
          "${modifier}+t" = "exec ${terminal}";
        };
  };
}
