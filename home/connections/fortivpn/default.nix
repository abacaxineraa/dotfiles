{ pkgs, ... }:

{
  home.packages = with pkgs; [
    openfortivpn
    openconnect
    (callPackage ./openfortivpn-webview.nix { })
  ];
}
