{ pkgs, config, inputs, ... }:

{
  imports = [
    ./vpn
    ./gnome
    ./emacs
    ./firefox
    ./terminal.nix
    ../modules/home-manager/emacs.nix
    inputs.catppuccin.homeManagerModules.catppuccin
  ];

  home.stateVersion = "24.05";
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    wget
    protonup
    discord
    spotify
    godot_4
    unzip
    evince
    fantasque-sans-mono
    libreoffice
    google-chrome
    (aspellWithDicts
      (dicts: with dicts; [ en en-computers en-science es fr ]))
  ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Ana Torres";
    userEmail = "anasofitorresbe@gmail.com";
  };


  gtk = {
    enable = true;
    cursorTheme = {
      name = "Numix-Cursor";
      package = pkgs.numix-cursor-theme;
    };
  };
}

