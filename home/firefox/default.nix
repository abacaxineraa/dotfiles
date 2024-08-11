{ pkgs, ... }:

{

  # imports = [ ./userpref.nix ];
  programs.firefox = {
    enable = true;
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
}
