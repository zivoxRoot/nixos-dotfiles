{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        spacing = 6;
        width = 42;

        margin-top = 6;
        margin-bottom = 6;
        margin-left = 6;
        margin-right = 0;

        fixed-center = true;

        modules-left = [
          "battery"
          "wireplumber"
          "backlight"
          "network"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "bluetooth"
          "mpris"
          "clock"
        ];

        clock = {
          format = "{:%H}\n{:%M}";
          tooltip-format = "{:%A %d %B %Y}";
          interval = 60;
          timezone = "Europe/Paris";
        };

        "hyprland/workspaces" = {
          all-outputs = true;
          sort-by-number = true;
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
        };

        mpris = {
          format = "{player_icon}\n{title}";
          format-paused = "\n{title}";
          max-length = 12;
          interval = 1;
          player-icon = {
            default = "";
            spotify = "";
            firefox = "";
            mpv = "";
          };
          on-click = "playerctl play-pause";
          on-click-right = "playerctl next";
        };

        network = {
          format-wifi = "\n{signalStrength}";
          format-ethernet = "󰈀";
          format-disconnected = "󰤫";
          tooltip = true;
        };

        bluetooth = {
          format = "";
          format-disabled = "󰂲";
          format-connected = "";
          tooltip-format = "{num_connections} connected";
          interval = 5;
        };

        backlight = {
          device = "amd_backlight";
          format = "󰃠\n{percent}";
          interval = 10;
        };

        wireplumber = {
          format = "{icon}\n{volume}";
          format-muted = "\nX";
          format-icons = [
            ""
            ""
            ""
          ];
          tooltip = false;
        };

        battery = {
          interval = 30;
          format = "{icon}\n{capacity}";
          format-charging = "󰂄\n{capacity}";
          format-icons = [
            ""
            ""
            ""
            ""
            ""
          ];
          states = {
            warning = 30;
            critical = 15;
          };
          tooltip-format = "{timeTo}";
        };
      };
    };

    style = ''
      /* === Catppuccin Mocha === */
      @define-color background #1e1e2e;
      @define-color surface #313244;
      @define-color foreground #cdd6f4;
      @define-color subtext #bac2de;

      @define-color blue #89b4fa;
      @define-color green #a6e3a1;
      @define-color yellow #f9e2af;
      @define-color red #f38ba8;
      @define-color lavender #b4befe;

      * {
        font-family: "JetBrainsMono Nerd Font", "Noto Sans", sans-serif;
        font-size: 10px;
        border: none;
        border-radius: 8px;
        min-height: 0;
      }

      window#waybar {
        background: transparent;
        color: @foreground;
        padding: 3px 4px;
      }

      tooltip {
        background: @surface;
        color: @foreground;
        border-radius: 8px;
        padding: 3px;
      }

      /* Generic module box */
      #battery,
      #wireplumber,
      #backlight,
      #network,
      #bluetooth,
      #mpris,
      #clock,
      #workspaces {
        margin: 4px 2px;
        padding: 3px 4px;
        background: alpha(@surface, 0.6);
      }

      #clock {
        color: @blue;
        font-weight: bold;
      }

      #mpris {
        color: @green;
      }

      #network {
        color: @blue;
      }

      #bluetooth {
        color: @lavender;
      }

      #backlight {
        color: @yellow;
      }

      #wireplumber {
        color: @lavender;
      }

      #wireplumber.muted {
        color: @red;
      }

      #battery {
        color: @green;
      }

      #battery.warning {
        color: @yellow;
      }

      #battery.critical {
        color: @red;
      }

      /* Workspaces (vertical) */
      #workspaces {
        padding: 3px 2px;
      }

      #workspaces button {
        color: @subtext;
        padding: 4px 0;
      }

      #workspaces button.active {
        color: @blue;
        font-weight: bold;
      }
    '';
  };
}
