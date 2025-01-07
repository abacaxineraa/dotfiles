{ pkgs, config, ... }:

{
  programs.nixvim = {
    enable = true;
    # defaultEditor = true;
    
    colorschemes.catppuccin.enable = true;
    plugins.lualine.enable = true;

    # options = {
    #   number = true;
    #   relativenumber = true;

    #   shiftwidth = true;
    # };
  };
}


  #extraConfigLua
