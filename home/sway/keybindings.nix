{
  config,
  pkgs,
  lib,
  ...
}:

{
  wayland.windowManager.sway.config = rec {
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
          XF86AudioRaiseVolume = "exec swayosd-client --output-volume raise";
          XF86AudioLowerVolume = "exec swayosd-client --output-volume lower";
          XF86AudioMute = "exec swayosd-client --output-volume mute-toggle";
          XF86AudioMicMute = "exec swayosd-client --input-volume mute-toggle";
          XF86MonBrightnessUp = "exec swayosd-client --brightness raise";
          XF86MonBrightnessDown = "exec swayosd-client --brightness lower";

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
          "${modifier}+space" = "exec ${pkgs.albert}/bin/albert show";
          #  "${modifier}+Shift+slash" = "exec ${lock-cmd}";
          "${modifier}+i" = "layout tabbed";
        };
  };
}
