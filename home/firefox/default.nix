{ pkgs, ... }:

{
  imports = [ ./userpref.nix ];
  programs.firefox = {
    enable = true;
    enableGnomeExtensions = true;
    package = pkgs.firefox-devedition;
    
    policies = {
      DisableFirefoxAccounts = true;
      DisableAppUpdate = true;
      CaptivePortal = false;
      DNSOverHTTPS.Enabled = false;
      DisableFirefoxStudies = true;
      DisableTelemetry = true;
      DisablePocket = true;
    };
    profiles.dev-edition-default = {
      extensions = [
        
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
