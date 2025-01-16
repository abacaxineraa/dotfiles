{ pkgs, config, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];
  
  programs.nixvim = {
    enable = true;
    # defaultEditor = true;
    
    colorschemes.dracula-nvim.enable = true;
    plugins.lualine.enable = true;

    clipboard = {
      register = "unnamedplus";

      providers.wl-copy.enable = true;
    };

    opts = {
      number = true;
      relativenumber = true;

      updatetime = 100; #faster completition
      tabstop = 4;
      softtabstop = 4;
      # 1 when more than 2, 0 never, 2 always
      showtabline = 2;
      expandtab = true;
      smartindent = true;
      autoindent = true;
      shiftwidth = 4;
      breakindent = true;
      cursorline = true;
      scrolloff = 8;
      foldmethod = "indent";
      linebreak = true;
      termguicolors = true;
      splitbelow = true;
      splitkeep = "screen";
      splitright = true;



      undofile = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      laststatus = 3; # When to use a status line for the last window
    };


    # extraPlugins = with pkgs.vimPlugins; [
    #   vim-nix
    # ];
    
  };
}


  #extraConfigLua
