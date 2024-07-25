{ pkgs, ... }:

{
  imports = [
    ./gnome
    ./emacs
    ./firefox
    ./terminal.nix
    ../modules/home-manager/emacs.nix
  ];
  
  home.stateVersion = "24.05";
  fonts.fontconfig.enable = true;
  
  home.packages = with pkgs; [
    wget
    protonup
    discord
    spotify
    git
    godot_4
    unzip
    evince
    #libreoffice-qt
  ];

  gtk = {
    enable = true;
    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };
  };
}
