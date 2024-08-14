{ pkgs, ... }:

{
  imports = [
    # ./userpref.nix
  ];
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
    package = pkgs.firefox-devedition;

    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = true;
      DisableAccounts = true;
      DisableFirefoxScreenshots = true;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DisplayBookmarksToolbar = "newtab";
      DisplayMenuBar = "never";
      SearchBar = "unified";
      DisableAppUpdate = true;
      CaptivePortal = false;
      DNSOverHTTPS.Enabled = false;
    };

    profiles.dev-editin-default = {
      extensions = with pkgs.nur.repos.rycee.firefox-addons; [
        darkreader
        ublock-origin
        privacy-badger
        videospeed
      ];

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
