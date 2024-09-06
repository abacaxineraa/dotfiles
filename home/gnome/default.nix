{ config, pkgs, ... }:

{
  imports = [ ./dconf.nix ];

  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = pkgs.gnomeExtensions.appindicator; }
      { package = pkgs.gnomeExtensions.vitals; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
      { package = pkgs.gnomeExtensions.caffeine; }
      { package = pkgs.gnomeExtensions.forge; }
      { package = pkgs.gnomeExtensions.compact-top-bar; }
    ];
  };

  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnome-console
    gnome.nautilus
  ];
}
