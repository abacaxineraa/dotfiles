{
  config,
  pkgs,
  lib,
  ...
}:
let
  swaylockcmd = "${pkgs.swaylock}/bin/swaylock -c '#020202'";
  idlecmd = pkgs.writeShellScript "swayidle.sh" ''
    ${pkgs.swayidle}/bin/swayidle \
    before-sleep "${swaylockcmd}" \
    lock "${swaylockcmd}" \
    timeout 500 "${swaylockcmd}" \
    timeout 1000 "${pkgs.systemd}/bin/systemctl suspend"
'';
in
{
  wayland.windowManager.sway.config = rec {
    input."type:keyboard" = lib.mkForce {
      xkb_layout = "us";
      xkb_variant = "altgr-intl";
      xkb_options = "ctrl:nocaps";
    };

    modifier = "Mod4";
    floating.modifier = modifier;
    menu = "tofi-drun | xargs swaymsg exec --";
    terminal = "alacritty";

    startup = [
      { always = true; command = "${pkgs.systemd}/bin/systemd-notify --ready || true"; }
      { always = true; command = "${pkgs.mako}/bin/mako --default-timeout 3000"; }
      { always = true; command = "touch $SWAYSOCK.wob && tail -n0 -f $SWAYSOCK.wob | ${pkgs.wob}/bin/wob"; }
      { command = "exec ${idlecmd}"; always = true; }
    ];
    
    keybindings = lib.mkOptionDefault {
      # Multimedia
      "XF86AudioPrev" = "exec ${pkgs.playerctl}/bin/playerctl previous";
      "XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl play-pause";
      "Shift+XF86AudioPlay" = "exec ${pkgs.playerctl}/bin/playerctl stop";
      "XF86AudioNext" = "exec ${pkgs.playerctl}/bin/playerctl next";
      "XF86AudioRecord" = "exec ${pkgs.alsa-utils}/bin/amixer -q set Capture toggle";
      "XF86AudioMute" = "exec ${pkgs.alsa-utils}/bin/amixer -q set Master toggle";
      "XF86AudioLowerVolume" = "exec ${pkgs.alsa-utils}/bin/amixer -q set Master 3%-";
      "XF86AudioRaiseVolume" = "exec ${pkgs.alsa-utils}/bin/amixer -q set Master 3%+";
      ## Backlight
      "XF86MonBrightnessDown" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 10%-";
      "XF86MonBrightnessUp" = "exec ${pkgs.brightnessctl}/bin/brightnessctl s 10%+";


      # Suspend
      "--locked Ctrl+${modifier}+z" = "exec ${swaylockcmd}";
      "Print" = "exec ${pkgs.grim}/bin/grim -g \"$(${pkgs.slurp}/bi/slurp)\" - | wl-copy'";
      "Shift+Print" = "exec ${pkgs.grim}/bin/grim - | wl-copy'";

      "${modifier}+f" = "exec ${pkgs.firefox-devedition}/bin/firefox-devedition";
      "${modifier}+s" = "exec ${menu}";
      "${modifier}+e" = "exec emacsclient -c";
      "${modifier}+t" = "exec ${terminal}";
      "${modifier}+m" = "fullscreen toggle";
      "${modifier}+space" ="exec ${menu}";
    };
  };
}
