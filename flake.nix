{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nur.url = "github:nix-community/NUR";
  };

  outputs =
    { nixpkgs, ... }@inputs:
    {
      nixosConfigurations = builtins.mapAttrs (
        machineName: _:
        nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            username = "abacaxinera";
          };
          modules = [
            (./machines + "/${machineName}")
            ./nixos
            { networking.hostName = machineName;}
          ];
        }
      ) (builtins.readDir ./machines);
    };
}  
