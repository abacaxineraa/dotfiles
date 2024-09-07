{
  inputs,
  pkgs,
  username,
  config,
  lib,
  ...
}:
{
  imports = [
    ./impermanence.nix
    ./user.nix
  ];

  system.stateVersion = "24.05";

  environment.etc."nixos-generation".source = inputs.self;

  environment.extraInit = ''
    unset ASPELL_CONF
    for i in ${builtins.concatStringsSep " " (lib.lists.reverseList config.environment.profiles)} ; do
      if [ -d "$i/lib/aspell" ]; then
        export ASPELL_CONF="dict-dir $i/lib/aspell"
      fi
    done

    export NIX_USER_PROFILE_DIR="/nix/var/nix/profiles/per-user/$USER"
    export NIX_PROFILES="${builtins.concatStringsSep " " (lib.lists.reverseList config.environment.profiles)}"
  '';

  nixpkgs = {
    overlays = [ inputs.nur.overlay ];
    config.allowUnfree = true;
  };

  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

  networking.networkmanager.enable = true;
  time.timeZone = "America/Toronto";

  programs = {
    command-not-found.enable = false;
    steam.enable = true;
    steam.gamescopeSession.enable = true;
    gamemode.enable = true;
    nh = {
      enable = true;
      flake = "/home/${username}/proyectos/dotfiles";
    };
  };

  hardware = {
    pulseaudio.enable = false;
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

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelParams = [ "nvidia_drm.fbdev=1" ];
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  };

  services = {
    pipewire.enable = true;
    pipewire.pulse.enable = true;
    printing.enable = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  programs.light.enable = true;
  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };

  security = {
    polkit.enable = true;
    pam = {
      services.swaylock = {
        text = "auth include login";
      };
      
      loginLimits = [
        {
          domain = "@users";
          item = "rtprio";
          type = "-";
          value = 1;
        }
    ];};
  };
}
