{ config, pkgs, ... }:

let
  extraCssConfig = ''
    .window-frame, .window-frame:backdrop {
      box-shadow: 0 0 0 black;
      border-style: none;
      margin: 0;
      border-radius: 0;
    }
    .titlebar {
      border-radius: 0;
    }
  '';
in
{
  imports = [ ./dconf.nix ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = pkgs.gnomeExtensions.pop-shell; }
      { package = pkgs.gnomeExtensions.appindicator; }
      { package = pkgs.gnomeExtensions.vitals; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
      { package = pkgs.gnomeExtensions.caffeine; }
    ];
  };

  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnome-console
    gnome.nautilus
  ];

  gtk = {
    enable = true;
    gtk3.extraCss = extraCssConfig;
    gtk4.extraCss = extraCssConfig;
  };
}
