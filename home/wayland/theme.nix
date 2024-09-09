{ config, pkgs, conf, ... }: 
let
  cursor-theme = "Numix-Cursor";
  cursor-size = 20;
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

  home.sessionVariables = {
    XCURSOR_THEME = cursor-theme;
    XCURSOR_SIZE = cursor-size;
    XDG_CONFIG_HOME = "\${HOME}/.config";
  };
  wayland.windowManager.sway.config.seat."*" = {
    xcursor_theme = "${cursor-theme} ${toString cursor-size}";
  };
 
  gtk.cursorTheme.name = cursor-theme;
  gtk.cursorTheme.size = cursor-size;
}
