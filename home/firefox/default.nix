{ pkgs, ... }:

{  
  imports = [
    #./userpref.nix 
  ];
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
    package = pkgs.firefox-devedition;
    
    policies = {
      NewTabPage = true;
      DisableFirefoxAccounts = true;
      DisableAppUpdate = true;
      CaptivePortal = false;
      DNSOverHTTPS.Enabled = false;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisablePocket = true;
    };

    profiles.dev-edition-default = {
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        ublock-origin
        privacy-badger
        videospeed
      ];

      bookmarks = [
        {
          name = "Toolbar";
          toolbar = true;
          bookmarks = [
            {
              name = "calendar";
              url = "https://calendar.google.com/calendar/u/0/r";
            }
            {
              name = "Hacker News";
              url = "https://news.ycombinator.com";
            }
            {
              name = "XKCD";
              url = "https://xkcd.com";
            }
            {
              name = "Gwern";
              url = "https://gwern.net";
            }
          ];
        }
      ];
    };
  };

  xdg.configFile = {
    "pop-shell/config.json".text = ''
      {
        "float": [
          {
            "class": "firefox",
            "title": "^(?!.*Mozilla Firefox).*$",
            "disabled": true
          }
        ],
        "skiptaskbarhidden": [],
        "log_on_focus": false
      }
    '';
  };
}
