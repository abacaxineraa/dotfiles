{
  programs.nixvim = {
    colorschemes.dracula-nvim.enable = true;
    plugins.lualine.enable = true;

    clipboard = {
      register = "unnamedplus";

      providers.wl-copy.enable = true;
    };

    opts = {
      number = true;
      updatetime = 100;
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
      spell = false;
      undofile = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;
      signcolumn = "yes";
      laststatus = 3;
    };


    # extraPlugins = with pkgs.vimPlugins; [
    #   vim-nix
    # ];
    
  };
}
