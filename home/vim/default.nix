{ pkgs, config, inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./completition.nix
    ./config.nix
    ./plugins
  ];


  programs.nixvim = {
    enable = true;
    # defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    
    performance = {
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "hmts.nvim"
          "nvim-treesitter"
        ];
      };
      byteCompileLua.enable = true;
    };

    autoCmd = [
      {
        event = "FileType";
        pattern = "help";
        command = "wincmd L";
      }
      
      {
        event = "FileType";
        pattern = [
          "tex"
          "latex"
          "markdown"
        ];
        command = "setlocal spell spelllang=en";
      }
    ];


    highlight.Todo = {
      fg = "Blue";
      bg = "Yellow";
    };

    match.TODO = "TODO";

    keymaps = [
      {
        mode = "n";
        key = "<C-t>";
        action.__raw = ''
          function()
            require('telescope.builtin').live_grep({
              default_text="TODO",
              initial_mode="normal"
            })
          end
        '';
        options.silent = true;
      }
    ];
  };
}  
    
  #extraConfigLua
