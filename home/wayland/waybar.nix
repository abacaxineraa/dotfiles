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

      modules-left = [ "custom/logo" "sway/workspaces" "sway/mode" ];
      modules-right = [ "sway/language" "clock" "battery" ];

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
          background: #292828;
          color: #ffffff;
        }
      
      
        #workspaces button {
          margin-right: 10px;
          color: #ffffff;
        }
        #workspaces button:hover, #workspaces button:active {
          background-color: #292828;
          color: #ffffff;
        }
        #workspaces button.focused {
          background-color: #383737;
        }

        #language {
          margin-right: 7px;		
        }

        #battery {
          margin-left: 7px;
          margin-right: 3px;
        }
         '';
}
