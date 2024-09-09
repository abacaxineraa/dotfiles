{ pkgs, ... }:

{
  imports = [
     ./keybindings.nix
     ./sway.nix
     ./waybar.nix
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
  ];

  home.pointerCursor = {
    package = pkgs.numix-cursor-theme;
    name = "Numix";
    size = 20;
    gtk.enable = true;
  };

  home.sessionVariables = {
    MOZ_ENABLE_WAYLAND = 1;
    QT_QPA_PLATFORM = "wayland";
    NIXOS_OZONE_WL=1;

    QT_AUTO_SCREN_SCALING_FACTOR=1 ;
    QT_WAYLAND_DISABLE_WINDOW_DECORATIONS=1;
    GDK_BACKEND="wayland";
    XDG_SESSION_TYPE="wayland";
    XDG_SESSION_DESKTOP="sway";
    XDG_CURRENT_DESKTOP="sway";
    JAVA_AWT_WM_NONREPARENTING=1;
  };
  
  services.swayosd.enable = true;

  programs.swaylock.enable =true;

  programs.tofi.enable = true;  
  
  services.kanshi = {
    enable = true;
    profiles = {
      #
    };
  };
  
}
