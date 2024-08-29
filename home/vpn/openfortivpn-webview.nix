{
  buildNpmPackage,
  fetchFromGitHub,
  electron,
}:
buildNpmPackage rec {
  pname = "openfortivpn-webview";
  version = "1.2.0-electron";

  src = fetchFromGitHub {
    owner = "gm-vm";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-HheqDjlWxHJS0+OEhRTwANs9dyz3lhhCmWh+YH4itOk=";
  };
  sourceRoot = "${src.name}/openfortivpn-webview-electron";

  npmDepsHash = "sha256-Vf8R0+RXHlXwPOnPENw8ooxIXT3kSppQmB2yk5TWEwg=";

  ELECTRON_SKIP_BINARY_DOWNLOAD = 1;

  dontNpmBuild = true;

  postInstall = ''
    makeWrapper ${electron}/bin/electron $out/bin/openfortivpn-webview \
        --add-flags $out/lib/node_modules/openfortivpn-webview/index.js
  '';



  # openfortivpn-webview --url 'https://ciena.okta.com' --trusted-cert='sha256/HJdEvkbyTW9ygH0azudaf8VN2Fuvl8odWWghLPX+T6c=' > cookie.txt

  # sudo openfortivpn "epxvpn.ciena.com:443" --cookie=#"$cookie" --pppd-accept-remote


  # VPN_HOST=epxvpn.ciena.com && VPN_PORT=443
  # openfortivpn-webview "${VPN_HOST}:${VPN_PORT}" 2>/dev/null \
  # | sudo openfortivpn "${VPN_HOST}:${VPN_PORT}" --cookie-on-stdin --pppd-accept-remote

  #openconnect --protocol=fortinet
  
}
