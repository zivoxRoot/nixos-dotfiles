{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "left";
        spacing = 3;
        width = 10;

        margin-top = 0;
        margin-bottom = 0;
        margin-left = -2;
        margin-right = 0;

        fixed-center = true;

        modules-left = [
          "battery"
          "pulseaudio"
          "backlight"
          "memory"
          "cpu"
          "temperature"
        ];

        modules-center = [
          "hyprland/workspaces"
        ];

        modules-right = [
          "bluetooth"
          "tray"
          "clock"
        ];

        "hyprland/workspaces" = {
          all-outputs = true;
          sort-by-number = true;
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
        };

        tray = {
          icon-size = 18;
          show-passive-items = true;
          spacing = 3;
          rotate = 90;
        };

        battery = {
          interval = 5;
          format = "{icon}\n{capacity}";
          format-charging = "\n{capacity}";
          format-plugged = "\n{capacity}";
          format-icons = [
            "󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾"
            "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"
          ];
          states = {
            warning = 40;
            critical = 20;
          };
        };

        pulseaudio = {
          format = "{icon}\n{volume}";
          format-muted = "󰖁\nX";
          format-icons = [ "󰖁" "" "" ];
          tooltip = true;
        };

        backlight = {
          device = "intel_backlight";
          format = "{icon}\n{percent}";
          format-icons = [
            "" "" "" "" "" "" ""
            "" "" "" "" "" "" "" ""
          ];
          interval = 60;
        };

        cpu = {
          format = "\n{usage}";
          interval = 2;
          tooltip = true;
        };

        memory = {
          format = "\n{percentage}";
          interval = 2;
          states = {
            critical = 80;
          };
          tooltip = true;
        };

        temperature = {
          thermal-zone = "/sys/class/thermal/thermal_zone6/type:x86_pkg_temp";
          critical-threshold = 65;
          format = "°\n{temperatureC}";
          format-critical = "🔥\n{temperatureC}";
          interval = 2;
        };

        bluetooth = {
          format = "";
          format-disabled = "󰂲";
          format-connected = "";
          tooltip-format = "Devices connected: {num_connections}";
          interval = 5;
        };

        clock = {
          format = "{:%I\n%M}";
          interval = 60;
          tooltip-format = "<big>{:%A, %d %B}</big>";
          timezone = "Asia/Kolkata";
        };
      };
    };

    style = ''
      @define-color foreground #cdd6f4;
      @define-color accent #89b4fa;
      @define-color critical #f38ba8;
      @define-color background #1e1e2e;

      * {
        font-family: "JetBrainsMono Nerd Font", "Noto Sans", sans-serif;
        font-size: 10px;
        border: none;
        border-radius: 0;
        min-height: 0;
      }

      window#waybar {
        background: alpha(@background, 0.85);
        color: @accent;
        margin: 1px;
        border-radius: 4px;
        padding: 5px 0;
      }

      tooltip {
        background: @background;
        color: @accent;
        border-radius: 6px;
      }

      #workspaces, #clock, #battery, #bluetooth, #pulseaudio,
      #cpu, #memory, #backlight, #tray, #temperature {
        margin: 4px 3px;
        border-radius: 6px;
      }

      #workspaces {
        background-color: alpha(@accent, 0.1);
      }

      #workspaces button.focused {
        background-color: @accent;
        color: @background;
      }

      #battery.warning { color: @critical; }
      #battery.critical { color: @critical; }
      #pulseaudio.muted { color: @critical; }
      #temperature.critical { color: @critical; }
      #memory.critical { color: @critical; }

      #clock {
        font-weight: bold;
      }

    '';
  };
}
