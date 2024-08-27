#{ pkgs, lib }:




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






  # pkgs.stdenv.mkDerivation rec {
#   pname = "openfortivpn-webview";
#   version = "1.20";
#   owner = "gm-vm";
#   repo = "openfortivpn-webview";
#   rev = "36fd3ea39306152470ab202e9049f282822a0eef";

#   src = pkgs.fetchFromGitHub {
#     owner = owner;
#     repo = repo;
#     rev = rev;
#     sha256 = "sha256-BM5hurJDPYpbt2WV6C1dldLx2wD9eDZlTK/TeHXpmY0=";
#   };

#   buildInputs = with pkgs.qt6; [ qmake qtwebengine qtwayland ];

#   nativeBuildInputs = with pkgs.qt6; [ wrapQtAppsHook qtwebengine qtwayland ];
#   dontWrapQtApps = false;

#   configurePhase = ''
#         cd ./openfortivpn-webview-qt
#     '';

#   buildPhase = ''
#         qmake . DESTDIR=$out/bin && make
#     '';




  
# pkgs.stdenv.mkDerivation rec {
  #   pname = "openfortivpn-webview";
  #   version = "1.2.0";

  #   src = pkgs.fetchFromGitHub {
  #     repo = "openfortivpn-webview";
  #     owner = "gm-vm";
  #     rev = "48e831167c25f10a33b4fd793ba3442ff0c89099";
  #     hash = "sha256-UJu0rD/mmb68daVtSe0Ll3DjL9NSOtIvBy0uypkNiXU=";
  #   };

  #   buildInputs = [ pkgs.qt6.qtbase pkgs.qt6.qtwebengine ];
  #   nativeBuildInputs = [ pkgs.qt6.wrapQtAppsHook ];
  #   dontWrapQtApps = true;

  #   installPhase = ''
  #           cd openfortivpn-webview-qt
  #           qmake .
  #           make
  #           mkdir -p $out/bin
  #           mv openfortivpn-webview $out/bin/
  #         '';

  #   meta = with lib; {
  #     description = "OpenfortiVPN webview to get the cookie";
  #     homepage = "https://github.com/gm-vm/openfortivpn-webview";
  #     license = licenses.mit;
  #     platforms = platforms.unix;
  #     mainProgram = "openfortivpn-webview";
  #   };
}
