{
  lib,
  config,
  ...
}:
{
  imports = [
  ./harpoon.nix
  ./lsp.nix
  ./lualine.nix
  ./markdown-preview.nix
  ./neo-tree.nix
  ./startify.nix
  ./telescope.nix
  ./treesitter.nix
  ./vimtex.nix 
  ./whichkey.nix
  ./tmux-navigator.nix
  ./fugitive.nix
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
