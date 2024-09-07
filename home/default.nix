{
  pkgs,
  config,
  inputs,
  ...
}:

{
  imports = [
    ./vpn
    ./sway
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
    godot_4
    unzip
    evince
    fantasque-sans-mono
    libreoffice
    google-chrome
    (aspellWithDicts (
      dicts: with dicts; [
        en
        en-computers
        en-science
        es
        fr
      ]
    ))
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
      name = "Numix";
      package = pkgs.numix-cursor-theme;
    };

    theme = {
      package = pkgs.catppuccin-gtk;
      name = "Catppuccin";
    };
  };
}
