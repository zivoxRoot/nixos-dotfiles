{ pkgs, ... }:

{
  services.greetd.enable = true;
  services.greetd.settings = {
    default_session = {
      command = ''
        ${pkgs.tuigreet}/bin/tuigreet \
        --time \
        --remember \
        --remember-session \
        --cmd Hyprland \
      '';
    };
  };

  services.openssh.enable = true;

  console.keyMap = "fr";

  programs.hyprland.enable = true;

  networking.networkmanager.enable = false;
  networking.wireless.iwd.enable = true;
  networking.wireless.iwd.settings = {
    General = {
      EnableNetworkConfiguration = true;
    };
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

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
}
