{
  lib,
  config,
  ...
}:
{
  imports = [
    ./barbar.nix
    # ./comment.nix
    # ./floaterm.nix
    #./harpoon.nix
    ./lsp.nix
    ./lualine.nix
    ./markdown-preview.nix
    #  ./neorg.nix
    ./neo-tree.nix
    ./startify.nix
    ./telescope.nix
    ./treesitter.nix
    ./vimtex.nix # inria
    ./whichkey.nix
    ./moveline.nix
  ];

  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };
    
    plugins = {
      # Lazy loading
      lz-n.enable = true;

      web-devicons.enable = true;

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      nvim-autopairs.enable = true;

      # oil = {
      #   enable = true;
      #   lazyLoad.settings.cmd = "Oil";
      # };

      trim = {
        enable = true;
        settings = {
          highlight = true;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "neo-tree"
            "TelescopePrompt"
          ];
        };
      };
    };
  };
}
