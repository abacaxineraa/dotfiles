# https://github.com/l-lin/dotfiles/blob/main/pkgs/openfortivpn-webview/default.nix

{ stdenvNoCC, lib }: stdenvNoCC.mkDerivation rec {
  pname = "openfortivpn-webview";
  version = "1.2.0";

  src = builtins.fetchTarball {
    url = "https://github.com/gm-vm/openfortivpn-webview/releases/download/v${version}-electron/openfortivpn-webview-${version}.tar.xz";
    sha256 = "050vsb60zk8q398rzgl0glz3a2jpfghllmcnm1gjfxm9i7n2ddsa";
  };

  phases = [ "unpackPhase" "installPhase" ];

  installPhase = ''
    mkdir -p $out/bin
    # We need to add everything from the tarball because it contains some dependencies used by the binary, like `libffmpeg.so`.
    cp -r * $out/bin
  '';

  meta = with lib; {
    description = "OpenfortiVPN webview to get the cookie";
    homepage = "https://github.com/gm-vm/openfortivpn-webview";
    license = licenses.mit;
    platforms = platforms.unix;
    mainProgram = "openfortivpn-webview";
  };
}
