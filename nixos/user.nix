{ inputs, username, ... }:

{
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  users = {
    users.${username} = {
      isNormalUser = true;
      hashedPassword = "$6$W1wEHPgv7TpCWoUh$Huovoj1TJy5nw5BbrHiZvaf.CNxsR/sP2F7tCY/pTqgA7qMJ54O670xA.v8L5EohpeTH1Y1IUtHK3JQ28N8k21";
      extraGroups = [ "wheel" "docker" "video" ];
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
