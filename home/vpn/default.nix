{ pkgs, ... }:


{
  
  home.packages = with pkgs; [
    openfortivpn
    (callPackage ./openfortivpn-webview.nix { })
  ];
}
