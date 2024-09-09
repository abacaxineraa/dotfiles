{ pkgs, ... }:

{
  imports = [
    ./keybindings.nix
    ./sway.nix
    ./waybar.nix
    ./theme.nix
    ./monitors.nix
  ];

  home.packages = with pkgs; [
    grim
    slurp
    mako
    swayidle
    wf-recorder
    wl-clipboard
    brightnessctl
    pamixer
    playerctl
    wob
    numix-cursor-theme
  ];

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
    NIXOS_OZONE_WL = 1;
    QT_AUTO_SCREN_SCALING_FACTOR = 1;
    QT_WAYLAND_DISABLE_WINDOW_DECORATIONS = 1;
    GDK_BACKEND = "wayland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "sway";
    XDG_CURRENT_DESKTOP = "sway";
    JAVA_AWT_WM_NONREPARENTING = 1;
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
  };

  programs.swaylock.enable = true;

  programs.tofi = {
    enable = true;
    settings = {
      font = "JetBrainsMono Nerd Font Mono";
      font-size = 20;
      width = "100%";
      height = "100%";
      border-width = 0;
      outline-width = 0;
      padding-left = "35%";
      padding-top = "35%";
      result-spacing = 25;
      num-results = 5;
      background-color = "#000A";
    };
  };

  services.swayidle = {
    enable = true;
    events = [
      {
        event = "before-sleep";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
      {
        event = "lock";
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
    timeouts = [
      {
        timeout = 360;
        command = "${pkgs.swaylock}/bin/swaylock -f";
      }
    ];
  };
}
