{
  pkgs,
  config,
  inputs,
  ...
}:

{
  imports = [
    ./connections
    ./common.nix
    ./wayland
    ./emacs
    ./firefox
    ./terminal.nix
    ../modules/home-manager/emacs.nix
  ];
}
