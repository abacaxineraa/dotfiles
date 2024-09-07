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
    ./sway.nix
    ./nvidia.nix
  ];
  
  system.stateVersion = "24.05";
  time.timeZone = "America/Toronto";
  environment.etc."nixos-generation".source = inputs.self;

  nix.settings.experimental-features = [
    "flakes"
    "nix-command"
  ];

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
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings.General.Experimental = true;
    };
  };
  
  networking.networkmanager.enable = true;

  boot = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
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
}


  #https://github.com/deciduously/nixos-config/tree/4f062170218f2315659314934af0326c75b98dc9
