{ pkgs, config, ... }:

{
  imports = [
    ./shell.nix
    ./tmux.nix
  ]
  
    home.packages = with pkgs; [
    alacritty-theme
    roboto-mono
  ];
  
  programs={
    alacritty = {
      enable = true;

      settings = {
        font = {
          normal.family = "Roboto Mono";
          size = 10;
        };

        cursor.style.shape = "Beam";

        window = {
          blur = false;
          opacity = 1;
          padding.x = 10;
          padding.y = 10;
        };

        general.import = [ "${pkgs.alacritty-theme}/horizon_dark.toml" ];
      };
    };
  };
}
