{
  config,
  pkgs,
  lib,
  username,
  ...
}:

let
  nverStable = config.boot.kernelPackages.nvidiaPackages.stable.version;
  nverBeta = config.boot.kernelPackages.nvidiaPackages.beta.version;
  nvidiaPackage =
    if (lib.versionOlder nverBeta nverStable) then
      config.boot.kernelPackages.nvidiaPackages.stable
    else
      config.boot.kernelPackages.nvidiaPackages.beta;

  extraEnv = {
    WLR_DRM_NO_ATOMIC = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    MOZ_DISABLE_RDD_SANDBOX = "1";
    EGL_PLATFORM = "wayland";
    XWAYLAND_NO_GLAMOR = "1";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm"; # remove if issue w ff
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_RENDERER = "vulkan";
  };
in
{
  config = {
    home-manager.users.${username} =
      { pkgs, ... }:
      {
        wayland.windowManager.sway = {
          extraOptions = [ "--unsupported-gpu" ];
        };
      };
    environment.variables = extraEnv;
    environment.sessionVariables = extraEnv;

    environment.systemPackages = with pkgs; [
      glxinfo
      vulkan-tools
      glmark2
    ];

    hardware = {
      nvidia = {
        package = nvidiaPackage;
        powerManagement.enable = true;
        modesetting.enable = true;
        prime.sync.enable = true;
        prime.intelBusId = "PCI:0:02:0";
        prime.nvidiaBusId = "PCI:01:0:0";
      };

      opengl = {
        enable = true;
        driSupport = true;
      };
    };

    services.xserver = {
      videoDrivers = [ "nvidia" ];
      displayManager.gdm.wayland = true;
    };
  };
}
