# https://github.com/l-lin/dotfiles/blob/main/pkgs/openfortivpn-webview/default.nix and https://github.com/pablomartan/openfortivpn-webview-qt/blob/main/openfortivpn-webview-qt/default.nix

{ pkgs, lib }:

pkgs.stdenv.mkDerivation rec {
  pname = "openfortivpn-webview";
  version = "1.2.0";

  src = pkgs.fetchFromGitHub {
    repo = "openfortivpn-webview";
    owner = "gm-vm";
    rev = "48e831167c25f10a33b4fd793ba3442ff0c89099";
    hash = "sha256-UJu0rD/mmb68daVtSe0Ll3DjL9NSOtIvBy0uypkNiXU=";
  };

  buildInputs = [ pkgs.qt6.qtbase pkgs.qt6.qtwebengine ];
  nativeBuildInputs = [ pkgs.qt6.wrapQtAppsHook ];
  dontWrapQtApps = true;

  installPhase = ''
    cd openfortivpn-webview-qt
    qmake .
    make
    mkdir -p $out/bin
    mv openfortivpn-webview $out/bin/
  '';

  meta = with lib; {
    description = "OpenfortiVPN webview to get the cookie";
    homepage = "https://github.com/gm-vm/openfortivpn-webview";
    license = licenses.mit;
    platforms = platforms.unix;
    mainProgram = "openfortivpn-webview";
  };
}
