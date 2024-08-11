{ config, pkgs, ... }:

{
  # imports = [ ./dconf.nix ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = pkgs.gnomeExtensions.pop-shell; }
      { package = pkgs.gnomeExtensions.appindicator; }
      { package = pkgs.gnomeExtensions.vitals; }
    ];
  };

  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnome-console
    gnome.nautilus
  ];
}
