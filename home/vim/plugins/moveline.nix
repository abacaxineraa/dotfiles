{
  programs.nixvim = {
    plugins.moveline-nvim.enable = true;
  };

  keymaps = [
    {
      mode = ["n"];
      key = "<M-k>";
      action = ":MoveLine(-1)<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }

    {
      mode = ["n"];
      key = "<M-j>";
      action = ":MoveLine(1)<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
  
    {
      mode = ["v"];
      key = "<M-k>";
      action = ":MoveBlock(-1)<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
  
    {
      mode = ["v"];
      key = "<M-j>";
      action = ":MoveBlock(1)<CR>";
      options = {
        silent = true;
        noremap = true;
      };
    }
  ];
}
