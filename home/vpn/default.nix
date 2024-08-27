{ pkgs, ... }:

{

  home.packages = with pkgs; [
    openfortivpn
    (callPackage ./openfortivpn-webview.nix { })
  ];
}
  
  # https://l-lin.github.io/nix/install-Forticlient-VPN-with-SAML-in-NixOS 
  
  # open VPN in one command line

  # VPN_HOST=some_host && VPN_PORT=443 \
  # && openfortivpn-webview "${VPN_HOST}:${VPN_PORT}" 2>/dev/null \
  # | sudo openfortivpn "${VPN_HOST}:${VPN_PORT}" --cookie-on-stdin --pppd-accept-remote
