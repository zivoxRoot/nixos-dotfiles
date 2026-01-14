{
  pkgs,
  inputs,
  config,
  ...
}:

let
  containers = {
    School = {
      id = 1;
      color = "purple";
      icon = "fingerprint";
    };
    Programming = {
      id = 2;
      color = "blue";
      icon = "briefcase";
    };
    Other = {
      id = 3;
      color = "green";
      icon = "briefcase";
    };
  };

  spaces = {
    School = {
      id = "c6de089c-410d-4206-961d-ab11f988d40a";
      icon = "📚";
      container = containers.School.id;
      position = 1000;
    };
    Programming = {
      id = "cdd10fab-4fc5-494b-9041-325e5759195b";
      icon = "💻";
      container = containers.Programming.id;
      position = 2000;
    };
    Other = {
      id = "cdd19fab-6fc5-494b-9341-32fe57491e50";
      icon = "🏠";
      container = containers.Other.id;
      position = 3000;
    };
  };

  pinsProgramming = {
    Notion = {
      id = "9d8a8f91-7e29-4688-ae2e-da4e49d4a179";
      url = "https://notion.so/";
      position = 101;
    };
    Github = {
      id = "8af62707-0722-4049-9801-bedced343333";
      url = "https://github.com";
      position = 102;
    };

    # Pins folder
    Nix = {
      id = "d85a9026-1458-4db6-b115-346746bcc692";
      isGroup = true;
      isFolderCollapsed = true;
      editedTitle = true;
      position = 200;
    };
    NixPackages = {
      id = "f8dd784e-11d7-430a-8f57-7b05ecdb4c77";
      url = "https://search.nixos.org/packages";
      position = 201;
      folderParentId = "Nix";
    };
    NixOptions = {
      id = "92931d60-fd40-4707-9512-a57b1a6a3919";
      url = "https://search.nixos.org/options";
      position = 202;
      folderParentId = "Nix";
    };
    HomeManagerOptions = {
      id = "2eed5614-3896-41a1-9d0a-a3283985359b";
      url = "https://home-manager-options.extranix.com";
      position = 203;
      folderParentId = "Nix";
    };
  };
  pinsSchool = {
    "Calendar" = {
      id = "8lf64707-0722-4249-9851-bedced343393";
      url = "https://calendar.google.com";
      position = 101;
    };
    "Drive" = {
      id = "fb316d70-2b5e-4c46-bf42-f4e82d635153";
      url = "https://drive.google.com/";
      position = 102;
    };
  };

  mkPins =
    pins: container: space:
    builtins.mapAttrs (
      _: pin:
      pin
      // {
        container = container.id;
        workspace = space.id;
      }
      // (
        if !(pin ? folderParentId) then
          {
            isEssential = true;
          }
        else
          { }
      )
      // (
        if pin ? folderParentId then
          {
            folderParentId = pins.${pin.folderParentId}.id;
          }
        else
          { }
      )
    ) pins;
in
{
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    profiles.default = {
      isDefault = true;

      containersForce = true;
      containers = containers;

      spacesForce = true;
      spaces = spaces;

      pins =
        mkPins pinsProgramming containers.Programming spaces.Programming
        // mkPins pinsSchool containers.School spaces.School;

      settings = {
        browser = {
          tabs.warnOnClose = false;
          download.panel.shown = false;
        };
      };

      extensions.packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin
        darkreader
      ];
    };

    policies = {
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
  };

  stylix.targets.zen-browser.profileNames = [ "default" ];
}
