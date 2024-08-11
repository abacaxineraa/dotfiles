{ lib, pkgs, ... }:

{
  dconf.settings =
    with lib.hm.gvariant;
    let
      wallpaper = builtins.toString ../../assets/wallpaper.jpg;
    in
      {
        # show battery, wallpaper, numberlock state, swap control-caps, theme and interface, mouse speed, tiling, night theme


        #   "org/gnome/desktop/input-sources" = {
        #     mru-sources = [
        #       (mkTuple [
        #         "xkb"
        #         "us"
        #       ])
        #     ];
        #     sources = [
        #       (mkTuple [
        #         "xkb"
        #         "us+altgr-intl"
        #       ])
        #     ];
        #     xkb-options = [ "terminate:ctrl_alt_bksp"
        #                     "ctrl:swapcaps"
        #                   ];
        #   };

        };
}
