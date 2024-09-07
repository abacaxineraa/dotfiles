{ config, pkgs, ... }:

let
  css = ''
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
      { package = pkgs.gnomeExtensions.vitals; }
      { package = pkgs.gnomeExtensions.caffeine; }
      { package = pkgs.gnomeExtensions.pop-shell; }
      { package = pkgs.gnomeExtensions.user-themes; }
      { package = pkgs.gnomeExtensions.blur-my-shell ; }
      { package = pkgs.gnomeExtensions.unite ; }
    ];
  };

  home.packages = with pkgs; [
    gnome.gnome-tweaks
    gnome.nautilus
    
    (fluent-icon-theme.override {
      colorVariants = [ "grey" ];
    })
    (fluent-gtk-theme.override {
      themeVariants = [ "grey" ];
      sizeVariants = [ "compact" "standard" ];
    })
  ];
}
