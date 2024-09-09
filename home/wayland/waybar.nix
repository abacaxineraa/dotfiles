{config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  
  programs.waybar.settings = {
    mainBar = {
      layer = "bottom";
      position = "bottom";
      height = 26;
      output = [
        "eDP-1"
      ];

      modules-left = [ "sway/workspaces" ];
      modules-right = [ "clock" "battery" ];

      "sway/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        disable-click = true;
      };

      "sway/mode" = {
        tooltip = false;
      };
      
      "clock" = {
        interval = 60;
        format = "{:%a %d/%m %I:%M}";
      };

      "battery" = {
        tooltip = false;
      };
    };
  };

  programs.waybar.style = ''
        * {
          border: none;
          border-radius: 0;
          padding: 0;
          margin: 0;
          font-size: 11px;
        }

        window#waybar {
          background: #000000;
          color: #505050;
        }
      
        #workspaces button {
          margin-right: 10px;
          color: #505050;
        }
        #workspaces button:hover, #workspaces button:active {
          background-color: #000000;
          color: #202020;
        }
        #workspaces button.focused {
          background-color: #101010;
        }

        #battery {
          margin-left: 7px;
          margin-right: 5px;
        }
         '';
}
