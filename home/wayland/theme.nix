{ config, pkgs, conf, ... }: 
let
  cursor-theme = "Numix-Cursor";
  cursor-size = 48;
in
{
  home.packages = with pkgs; [ numix-cursor-theme dconf ];
  gtk.enable = true;
  xsession.enable = true;

  home.pointerCursor = {
    gtk.enable =true;
    package = pkgs.numix-cursor-theme;
    name = cursor-theme;
    size = cursor-size;
  };

  #   gtk.gtk3.extraConfig = {
  #     gtk-dialogs-use-header = false;
  #     gtk-cursor-theme-size = 0;
  #     gtk-toolbar-style = "GTK_TOOLBAR_BOTH_HORIZ";
  #     gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
  #     gtk-button-images = 0;
  #     gtk-menu-images = 0;
  #     gtk-enable-event-sounds = 0;
  #     gtk-enable-input-feedback-sounds = 1;
  #     gtk-xft-antialias = 1;
  #     gtk-xft-hinting = 1;
  #     gtk-xft-hintstyle = "hintslight";
  #     gtk-xft-rgba = "none";
  #   };

  home.sessionVariables = {
    XCURSOR_THEME = cursor-theme;
    XCURSOR_SIZE = cursor-size;
  };
  wayland.windowManager.sway.config.seat."*" = {
    xcursor_theme = "${cursor-theme} ${toString cursor-size}";
  };

  gtk.cursorTheme.name = cursor-theme;
  gtk.cursorTheme.size = cursor-size;
}
