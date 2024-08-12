{ pkgs, ... }:

{

  # imports = [ ./userpref.nix ];
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
      DisplayBookmarksToolbar = "never"; # or "always" or "newtab"
      DisplayMenuBar = "default-off"; # or "always", "never" or "default-on"
      SearchBar = "unified"; # or "separate"
      #   DisableAppUpdate = true;
      #   CaptivePortal = false;
      #   DNSOverHTTPS.Enabled = false;
    };

    profiles.dev-edition-default = {
      extensions = [ ];
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
