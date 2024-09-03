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

  environment.extraInit =
    ''
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
  };

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
      excludePackages = with pkgs; [ xterm ];
      videoDrivers = [ "nvidia" ];
    };

    udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
    gnome = {
      gnome-browser-connector.enable = true;
      core-utilities.enable = false;
    };

    pipewire.enable = true;
    pipewire.pulse.enable = true;
    printing.enable = true;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };

  environment.gnome.excludePackages = [ pkgs.gnome-tour ];

  # services.hardware.openrgb.enable = true;
  # environment.systemPackages = with pkgs; [ openrgb-with-all-plugins ];

  # hardware = {
  #   opengl.enable = true;
  #   nvidia = {
  #     modesetting.enable = true;
  #     nvidiaSettings = true;
  #   };
  # };

  virtualisation.docker =
    {
      enable = true;
      # rootless = {
      #   enable = true;
      #   setSocketVariable = true;
      # };
    };
  users.users.${username}.extraGroups = [ "docker" ];
}
