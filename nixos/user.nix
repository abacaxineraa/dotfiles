{ inputs, username, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users = {
    users.${username} = {
      isNormalUser = true;
      hashedPassword = "hi!";
      extraGroups = [ "wheel" ];
    };
    mutableUsers = false;
  };

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users.${username} = {
      imports = [
        ../home
        {
          home = {
            inherit username;
            homeDirectory = "/home/${username}";
          };
        }
      ];
    };
  };
}
