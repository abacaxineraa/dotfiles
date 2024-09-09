{ pkgs, ... }:

{
  services.kanshi = {
    enable = true;
    profiles = {
      "default" = {
        exec = "notify-send 'Kanshi switched to default profile'";
        outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            mode = "1920x1080";
            position = "0,0";
          }
        ];
      };
      "at-home" = {
        exec = "notfiy-send 'Welcome home!'";
        outputs = [
          {
            criteria = "eDP-1";
            mode = "1920x1080";
            position = "0,0";
          }
          {
            criteria = "Dell Inc. DELL S3422DWG 25Z6KK3";
            mode = "3440x1440@59.973Hz";
            position = "3440,0";
          }
        ];
      };
    };
  };

  wayland.windowManager.sway.config = {
    output = {
      "*" = {
        background = "#101010 solid_color";
      };
    };
  };

  wayland.windowManager.sway.extraConfig = ''
    output HDMI-A-1 pos 0 0
  output eDP1 pos 3440 0
  '';
}
