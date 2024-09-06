{ lib, pkgs, ... }:

{
  dconf.settings =
    with lib.hm.gvariant;
    let
      wallpaper = builtins.toString ../../assets/wallpaper.jpg;
    in
      {
        "org/gnome/desktop/interface" = {
          show-battery-percentage = true;
        };

        "org/gnome/desktop/background" = {
          picture-uri = wallpaper;
          picture-uri-dark = wallpaper;
          piture-options = "scaled";
        };

        "org/gnome/desktop/peripherals/keyboard" = {
          numberlock-state = true;
        };

        "org/gnome/desktop/screensaver" = {
          picture-uri = wallpaper;
          picture-uri-dark = wallpaper;
          picture-options = "scaled";
        };

        "org/gnome/desktop/input-sources" = {
          mru-sources = [
            (mkTuple [
              "xkb"
              "us"
            ])
          ];
          sources = [
            (mkTuple [
              "xkb"
              "us+altgr-intl"
            ])
          ];
          xkb-options = [
            "terminate:ctrl_alt_bksp"
            "ctrl:nocaps"
          ];
        };

        "org/gnome/desktop/interface" = {
          clock-show-weekday = true;
          font-antialiasing = "grayscale";
          font-hinting = "slight";
          color-scheme = "prefer-dark";
          toolkit-accessibility = true;
        };

        "org/gnome/desktop/peripherals/mouse" = {
          natural-scroll = true;
          speed = 0.21052631578947367;
        };

        "org/gnome/mutter" = {
          dynamic-workspaces = true;
          edge-tiling = false;
        };

        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enabled = true;
          night-light-schedule-automatic = true;
          night-light-schedule-to = 8.0;
          night-light-temperature = mkUint32 3170;
        };

        "org/gnome/desktop/wm/preferences" = {
          button-layout = "close,minimize,maximize:appmenu";
        };

        "org/gnome/shell/extensions/pop-shell" = {
          active-hint = false;
          active-hint-border-radius = 1;
          gap-inner = mkUint32 0;
          gap-outer = mkUint32 0;
          tile-by-default = true;
        };

        "org/gnome/shell" = {
          enabled-extensions = [
            "pop-shell@system76.com"
            "appindicatorsupport@rgcjonas.gmail.com"
            "Vitals@CoreCoding.com"
            "native-window-placement@gnome-shell-extensions.gcampax.github.com"
            "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
          ];
        };
      };
}
