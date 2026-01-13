{ ... }:

let
  vars = import ./variables.nix;
in
{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = vars.gaps_in;
      gaps_out = vars.gaps_out;
      border_size = vars.border_size;

      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
    };

    decoration = {
      rounding = vars.rounding;
      rounding_power = 2;

      active_opacity = vars.active_opacity;
      inactive_opacity = vars.inactive_opacity;

      dim_special = vars.dim_special;

      shadow = {
        enabled = vars.shadow_enabled;
        range = 4;
        render_power = 3;
      };

      blur = {
        enabled = vars.blur_enabled;
        size = 3;
        passes = 2;
        vibrancy = 0.1696;
      };
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    ecosystem = {
      no_update_news = true;
      no_donation_nag = true;
    };

    misc = {
      disable_hyprland_logo = true;
      disable_hyprland_guiutils_check = true;
      animate_manual_resizes = true;
      animate_mouse_windowdragging = true;
      disable_autoreload = true;
      initial_workspace_tracking = 0;
    };
  };
}
