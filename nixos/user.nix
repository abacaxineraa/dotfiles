{ inputs, username, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users = {
    users.${username} = {
      isNormalUser = true;
      hashedPassword = "$y$j9T$abJFO.M.PUao5LDd0mQxq/$8gycOypqgBLLqmnFgxLi3YvQrkARbUNKnX5Pk9wejq6!";
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
