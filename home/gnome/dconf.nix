{ lib, pkgs, ... }:

{
  dconf.settings =
    with lib.hm.gvariant;
    let
      wallpaper = "file://${../../assets/wallpaper.png}";
    in
      {
        "org/gnome/desktop/interface" = {
          show-battery-percentage = true;
          icon-theme = "Fluent-grey-light";
          gtk-theme = "Fluent-grey-Dark-compact";
          clock-show-weekday = true;
          font-antialiasing = "rgba";
          font-hinting = "slight";
          color-scheme = "prefer-dark";
          toolkit-accessibility = true;
          text-scaling-factor = 0.92;
        };

        "org/gnome/desktop/background" = {
          picture-uri = wallpaper;
          picture-uri-dark = wallpaper;
          piture-options = "scaled";
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

        "org/gnome/desktop/peripherals/mouse" = {
          natural-scroll = true;
          speed = 0.21052631578947367;
        };

        "org/gnome/mutter" = {
          dynamic-workspaces = true;
        };

        "org/gnome/settings-daemon/plugins/color" = {
          night-light-enabled = true;
          night-light-schedule-automatic = true;
          night-light-schedule-to = 8.0;
          night-light-temperature = mkUint32 3170;
        };

        "org/gnome/shell" = {
          enabled-extensions = [
            "caffeine@patapon.info"
            "Vitals@CoreCoding.com"
          ];
        };

        "org/gnome/shell/extensions/user-theme" = {
          name = "Fluent-grey-Dark";
        };

        "org/gnome/desktop/wm/preferences" = {
          button-layout = "appmenu:minimize,close";
        };

        "org/gnome/desktop/wm/keybindings" = {
          begin-move = [ ];
          begin-resize = [ "<Menu>" ];
          close = ["<Super><Shift>q"];
          cycle-group = [ ];
          cycle-group-backward = [ ];
          cycle-panels = [ ];
          cycle-panels-backward = [ ];
          cycle-windows = [ ];
          cycle-windows-backward = [ ];
          maximize = [ ];
          minimize = [ ];
          move-to-workspace-1 = [ "<Super><Shift>1" ];
          move-to-workspace-2 = [ "<Super><Shift>2" ];
          move-to-workspace-3 = [ "<Super><Shift>3" ];
          move-to-workspace-4 = [ "<Super><Shift>4" ];
          switch-applications = [ ];
          switch-applications-backward = [ ];
          switch-group = [ ];
          switch-group-backward = [ ];
          switch-panels = [ ];
          switch-panels-backward = [ ];
          switch-to-workspace-1 = ["<Super>1" ];
          switch-to-workspace-2 = ["<Super>2" ];
          switch-to-workspace-3 = ["<Super>3" ];
          switch-to-workspace-4 = ["<Super>4" ];
          switch-to-workspace-down = [ "<Control><Alt>Down" ];
          switch-to-workspace-last = [ ];
          switch-to-workspace-left = [ "<Control><Alt>Left" ];
          switch-to-workspace-right = [ "<Control><Alt>Right" ];
          switch-to-workspace-up = [ ];
          toggle-maximized = [ "<Super>m" ];
          unmaximize = [ ];
        };
      };
}
