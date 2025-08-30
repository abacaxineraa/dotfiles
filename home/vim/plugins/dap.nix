{ config, pkgs, lib, ... }:

{
  programs.neovim = {
    enable = true;

    plugins = {
      dap = {
        enable = true;
        signs = {
          dapBreakpoint = { text = "●"; texthl = "DapBreakpoint"; };
          dapBreakpointCondition = { text = "●"; texthl = "DapBreakpointCondition"; };
          dapLogPoint = { text = "◆"; texthl = "DapLogPoint"; };
        };
        configurations = {
          java = [
            {
              type = "java";
              request = "launch";
              name = "Debug (Attach) - Remote";
              hostName = "127.0.0.1";
              port = 5005;
            }
          ];
        };
      };

      dap-ui = {
        enable = true;
        settings = {
          floating.mappings = { close = ["<ESC>" "q"]; };
        };
      };

      dap-virtual-text = { enable = true; };
      dap-python = { enable = true; };
    };

    extraConfig = ''
      nnoremap <silent> <leader>dB :lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
      nnoremap <silent> <leader>db :DapToggleBreakpoint<CR>
      nnoremap <silent> <leader>dc :DapContinue<CR>
      nnoremap <silent> <leader>da :lua require('dap').continue({ before = get_args })<CR>
      nnoremap <silent> <leader>dC :lua require('dap').run_to_cursor()<CR>
      nnoremap <silent> <leader>dg :lua require('dap').goto_()<CR>
      nnoremap <silent> <leader>di :DapStepInto<CR>
      nnoremap <silent> <leader>do :DapStepOut<CR>
      nnoremap <silent> <leader>dO :DapStepOver<CR>
      nnoremap <silent> <leader>dr :DapToggleRepl<CR>
      nnoremap <silent> <leader>du :lua require('dapui').toggle()<CR>
      nnoremap <silent> <leader>dw :lua require('dap.ui.widgets').hover()<CR>
      vnoremap <silent> <leader>de :lua require('dapui').eval()<CR>
      nnoremap <silent> <leader>de :lua require('dapui').eval()<CR>
    '';
  };
}
