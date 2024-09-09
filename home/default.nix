{
  pkgs,
  config,
  inputs,
  ...
}:

{
  imports = [
    ./vpn
    ./wayland
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

    quattrocento-sans
    jetbrains-mono
    martian-mono
    
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

}
