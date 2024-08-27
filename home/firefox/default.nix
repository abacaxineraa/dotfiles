{ pkgs, ... }:

{
  imports = [
    #./userpref.nix 
  ];
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
    package = pkgs.firefox-devedition;
        
    # policies = {
    #   DisableTelemetry = true;
    #   DisableFirefoxStudies = true;
    #   DXNSOverHTTPS.Enabled = false;
    #   EnableTrackingProtection = {
    #     Value = true;
    #     Locked = true;
    #     Cryptomining = true;
    #     Fingerprinting = true;
    #   };
    #   DisablePocket = true;
    #   DisableFirefoxAccounts = true;
    #   OverrideFirstRunPage = "";
    #   OverridePostUpdatePage = "";
    #   DisplayBookmarksToolbar = "newtab";
    #   DisplayMenuBar = "never";
    #   SearchBar = "unified";
    # };

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
