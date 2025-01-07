{ pkgs, config, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    #inputs.catppuccin.homeManagerModules.catppuccin
  ];
  
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
