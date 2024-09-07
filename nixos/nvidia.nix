{ config, pkgs, ... }:

{
  environment.sessionVariables = {
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

  
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    nvidia = {
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
}
