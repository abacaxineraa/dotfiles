{
  programs.nixvim = {
    opts = {
    timeoutlen = 500;
  };
    plugins.which-key = {
      enable = true;
      settings.preset = "helix";
    };
  };
}
