{ config, pkgs, lib, ... }:

let
  myGtkTheme = pkgs.catppuccin-gtk.override {
    accents = [ "pink" ];
    size = "compact";
    tweaks = [ "rimless" "black" ];
    variant = "macchiato";
  };
in
{
  gtk = {
      enable = true;
      theme = {
        name = "catppuccin-macchiato-pink-compact+rimless,black";
        package = myGtkTheme;
      };
    };

  xdg.configFile."gtk-4.0/assets".source =
      "${myGtkTheme}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    xdg.configFile."gtk-4.0/gtk.css".source =
      "${myGtkTheme}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    xdg.configFile."gtk-4.0/gtk-dark.css".source =
      "${myGtkTheme}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";

    home.packages = with pkgs; [
      gnomeExtensions.clipboard-indicator
      gnomeExtensions.caffeine
      gnomeExtensions.vitals
      gnomeExtensions.workspace-switcher-manager
      gnomeExtensions.forge
      gnomeExtensions.blur-my-shell
      gnomeExtensions.clipqr
      gnome-tweaks
      catppuccin-cursors.macchiatoPink
      catppuccin-cursors.macchiatoLavender
      catppuccin-cursors.macchiatoMauve
    ];


    dconf.settings = {

      "org/gnome/shell" = {
        disable-user-extensions = false;
        favorite-apps = [ ];
        enabled-extensions = [
          "blur-my-shell@aunetx"
          "caffeine@patapon.info"
          "clipboard-indicator@tudmotu.com"
          "forge@jmmaranan.com"
          "just-perfection-desktop@just-perfection"
          "logomenu@aryan_k"
          "Vitals@CoreCoding.com"
          "workspace-switcher-manager@G-dH.github.com"
          "drive-menu@gnome-shell-extensions.gcampax.github.com"
          "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "color-picker@tuberry"
          "clipqr@drien.com"
        ];
      };

      "org/gnome/shell/extensions/user-theme" = {
        name = "catppuccin-macchiato-pink-compact+rimless,black";
      };

      "org/gnome/shell/extensions/search-light" = {
        shortcut-search = [ "<Alt>f" ];
      };
    };

    "org/gtk/settings/file-chooser" = {
      show-hidden = true;
      sort-directories-first = true;
    };
    
    "org/gnome/settings-daemon/plugins/media-keys" = {
      "screensaver" = [ "" ];
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom5/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom6/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom7/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom8/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom9/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom10/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom11/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom12/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom13/"
      ];
    };
    
    "org/gnome/desktop/wm/keybindings" = {
      switch-to-workspace-1 = [ "<Alt>1" ];
      switch-to-workspace-2 = [ "<Alt>2" ];
      switch-to-workspace-3 = [ "<Alt>3" ];
      switch-to-workspace-4 = [ "<Alt>4" ];
      switch-to-workspace-5 = [ "<Alt>5" ];
      move-to-workspace-1 = [ "<Alt><Shift>1" ];
      move-to-workspace-2 = [ "<Alt><Shift>2" ];
      move-to-workspace-3 = [ "<Alt><Shift>3" ];
      move-to-workspace-4 = [ "<Alt><Shift>4" ];
      move-to-workspace-5 = [ "<Alt><Shift>5" ];
      close = [ "<Alt><Shift>q" ];
    };
    
    "org/gnome/shell/keybindings" = {
      toggle-quick-settings = [ "<Alt>x" ];
      toggle-message-tray = [ "<Alt>m" ];
      toggle-application-view = [ "" ];
      show-screenshot-ui = [ ];
      open-new-window-application-1 = [ "" ];
      open-new-window-application-2 = [ "" ];
      open-new-window-application-3 = [ "" ];
      open-new-window-application-4 = [ "" ];
      open-new-window-application-5 = [ "" ];
      open-new-window-application-6 = [ "" ];
      open-new-window-application-7 = [ "" ];
      open-new-window-application-8 = [ "" ];
      open-new-window-application-9 = [ "" ];
    };

    "org/gnome/desktop/interface" = {
      gtk-key-theme = "Emacs";
    };
          
    "org/gnome/shell/extensions/forge/keybindings" = {
      con-split-horizontal = [ "<Alt>z" ];
      con-split-vertical = [ "<Alt>v" ];
      con-stacked-layout-toggle = [ "" ];
      con-tabbed-layout-toggle = [ "" ];
      con-tabbed-showtab-decoration-toggle = [ "<Control><Alt>y" ];
      focus-border-toggle = [ "" ];
      prefs-tiling-toggle = [ "" ];
      window-focus-down = [ "<Alt>j" ];
      window-focus-left = [ "<Alt>h" ];
      window-focus-right = [ "<Alt>l" ];
      window-focus-up = [ "<Alt>k" ];
      window-move-down = [ "<Shift><Alt>j" ];
      window-move-left = [ "<Shift><Alt>h" ];
      window-move-right = [ "<Shift><Alt>l" ];
      window-move-up = [ "<Shift><Alt>k" ];
      window-snap-center = [ "<Control><Alt>c" ];
      window-swap-down = [ "<Control><Alt>j" ];
      window-swap-last-active = [ "<Alt>Return" ];
      window-swap-left = [ "<Control><Alt>h" ];
      window-swap-right = [ "<Control><Alt>l" ];
      window-swap-up = [ "<Control><Alt>k" ];
      window-toggle-always-float = [ "" ];
      window-toggle-float = [ "" ];
      workspace-active-tile-toggle = [ "" ];
    };
}
