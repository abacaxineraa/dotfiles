{ pkgs, ... }:

{
  imports = [
    ./common.nix
    ./connections
    ./gnome
    ./emacs
    ./firefox
    ./terminal.nix
    ../modules/home-manager/emacs.nix
  ];
}
