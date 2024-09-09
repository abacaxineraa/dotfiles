{ config, pkgs, ... }:

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
      tweaks = [
        "square"
        "solid"
        "noborder"
      ];
    })
  ];
}
