{ pkgs, ... }:

{
  imports = [
    ./common.nix
    ./connections
    ./gnome
    ./emacs
    ./firefox
    ../modules/home-manager/emacs.nix
    ./vim
    ./terminal
  ];
}
