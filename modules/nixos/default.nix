{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./users.nix
    ./desktop.nix
    ./system.nix
  ];

  environment.etc."zen/policies/policies.json".text = ''
    {
      "policies": {
        "DisableTelemetry": true,
        "DisableAppUpdate": true,

        "Extensions": {
          "Install": [
            "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi",
            "https://addons.mozilla.org/firefox/downloads/latest/darkreader/latest.xpi",
            "https://addons.mozilla.org/firefox/downloads/latest/wappalyzer/latest.xpi",
            "https://addons.mozilla.org/firefox/downloads/latest/pywalfox/latest.xpi"
          ]
        },

        "ExtensionSettings": {
          "*": {
            "installation_mode": "allowed"
          },

          "ublock-origin@raymondhill.net": {
            "installation_mode": "force_installed"
          },

          "addon@darkreader.org": {
            "installation_mode": "force_installed"
          },

          "wappalyzer@wappalyzer.com": {
            "installation_mode": "force_installed"
          },
          "pywalfox@frewacom.org": {
            "installation_mode": "force_installed"
          }
        }
      }
    }
  '';

  xdg.mime.defaultApplications = {
    "text/html" = "zen.desktop";
    "x-scheme-handler/http" = "zen.desktop";
    "x-scheme-handler/https" = "zen.desktop";
  };

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    vim
  ];
}
