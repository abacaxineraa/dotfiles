{ config, pkgs, conf, ... }:
{
  home.packages = [ pkgs.dconf ];
  gtk.enable = true;
  xsession.enable = true;

  home.pointerCursor = {
    package = pkgs.numix-cursor-theme;
    name = "Numix";
    size = 20;
  };

  gtk.cursorTheme = {
    package = pkgs.numix-cursor-theme;
    name = "Numix";
    size = 20;
  };

  # home.pointerCursor.x11.defaultCursor = "capitaine-cursors-white";
  # home.pointerCursor.x11.enable = true;

  gtk.gtk3.extraConfig = {
    gtk-dialogs-use-header = false;
    gtk-cursor-theme-size = 0;
    gtk-toolbar-style = "GTK_TOOLBAR_BOTH_HORIZ";
    gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
    gtk-button-images = 0;
    gtk-menu-images = 0;
    gtk-enable-event-sounds = 0;
    gtk-enable-input-feedback-sounds = 1;
    gtk-xft-antialias = 1;
    gtk-xft-hinting = 1;
    gtk-xft-hintstyle = "hintslight";
    gtk-xft-rgba = "none";
  };
}
