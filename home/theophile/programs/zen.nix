{
  pkgs,
  inputs,
  config,
  ...
}:

{
  programs.zen-browser = {
    enable = true;
    nativeMessagingHosts = [ pkgs.firefoxpwa ];

    profiles.default = {
      isDefault = true;

      containersForce = true;
      containers = {
        School = {
          color = "purple";
          icon = "fingerprint";
          id = 1;
        };
        Programming = {
          color = "blue";
          icon = "briefcase";
          id = 2;
        };
        Other = {
          color = "green";
          icon = "briefcase";
          id = 3;
        };
      };
      spacesForce = true;
      spaces =
        let
          containers = config.programs.zen-browser.profiles."default".containers;
        in
        {
          "School" = {
            id = "c6de089c-410d-4206-961d-ab11f988d40a";
            icon = "📚";
            container = containers."School".id;
            position = 1000;
          };
          "Programming" = {
            id = "cdd10fab-4fc5-494b-9041-325e5759195b";
            icon = "💻";
            container = containers."Programming".id;
            position = 2000;
          };
          "Other" = {
            id = "cdd19fab-6fc5-494r-9341-32fe57491e50";
            icon = "🏠";
            container = containers."Other".id;
            position = 3000;
          };
        };

      pins =
        let
          containers = config.programs.zen-browser.profiles."default".containers;
          spaces = config.programs.zen-browser.profiles."default".spaces;
          pins = config.programs.zen-browser.profiles."default".pins;
        in
        {
          "Notion" = {
            id = "9d8a8f91-7e29-4688-ae2e-da4e49d4a179";
            container = containers.Programming.id;
            url = "https://notion.so/";
            isEssential = true;
            position = 101;
          };
          "Github" = {
            id = "8af62707-0722-4049-9801-bedced343333";
            container = containers.Programming.id;
            url = "https://github.com";
            isEssential = true;
            position = 102;
          };
          "Calendar" = {
            id = "8lf64707-0722-4249-9851-bedced343393";
            container = containers.School.id;
            url = "https://calendar.google.com";
            isEssential = true;
            position = 101;
          };
          "Drive" = {
            id = "fb316d70-2b5e-4c46-bf42-f4e82d635153";
            container = containers.School.id;
            url = "https://drive.google.com/";
            isEssential = true;
            position = 102;
          };
          "Nix" = {
            id = "d85a9026-1458-4db6-b115-346746bcc692";
            container = containers.Programming.id;
            isGroup = true;
            isFolderCollapsed = true;
            editedTitle = true;
            position = 200;
          };
          "Nix Packages" = {
            id = "f8dd784e-11d7-430a-8f57-7b05ecdb4c77";
            workspace = spaces.Programming.id;
            folderParentId = pins."Nix".id;
            url = "https://search.nixos.org/packages";
            position = 201;
          };
          "Nix Options" = {
            id = "92931d60-fd40-4707-9512-a57b1a6a3919";
            workspace = spaces.Programming.id;
            folderParentId = pins."Nix".id;
            url = "https://search.nixos.org/options";
            position = 202;
          };
          "Home Manager Options" = {
            id = "2eed5614-3896-41a1-9d0a-a3283985359b";
            workspace = spaces.Programming.id;
            folderParentId = pins."Nix".id;
            url = "https://home-manager-options.extranix.com";
            position = 203;
          };
        };

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
