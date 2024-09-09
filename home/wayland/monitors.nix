{  pkgs,  ...}:

{
  services.kanshi = {
    enable = true;
    profiles = {
      #
    };
  };


  # out_aw25 = "Dell Inc. Dell AW2521H #HLAYMxgwABDZ";

  wayland.windowManager.sway.config = {
    # output = {
    #   "*" =
    #     "${out_aw25}" = {
    #       scale = "1.0";
    #       mode = "1920x1080@240Hz";
    #       adaptive_sync = "enable";
    #       subpixel = "rgb";
    #       render_bit_depth = "10"; # todo
    #     };
    # };
  };
}

