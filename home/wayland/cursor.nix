{ config, pkgs, conf, ... }: 
let
  cursor-theme = "Numix-Cursor";
  cursor-size = 20;
in
{
  home.packages = with pkgs; [ numix-cursor-theme ];
  gtk.enable = true;
  gtk.cursorTheme.name = cursor-theme;
  gtk.cursorTheme.size = cursor-size;

  xsession.enable = true;

  home.sessionVariables = {
    XCURSOR_THEME = cursor-theme;
    XCURSOR_SIZE = cursor-size;
    XDG_CONFIG_HOME = "\${HOME}/.config";
  };
  wayland.windowManager.sway.config.seat."*" = {
    xcursor_theme = "${cursor-theme} ${toString cursor-size}";
  };
}
