{ ... }:

{
  wayland.windowManager.hyprland.settings = {
    enable_fractional_scaling = true;

    general = {
      gaps_in = 8;
      gaps_out = 16;
      border_size = 2;

      resize_on_border = false;
      allow_tearing = false;
      layout = "dwindle";
    };

    decoration = {
      rounding = 10;
      rounding_power = 2;

      shadow = {
        enabled = true;
        range = 4;
        render_power = 3;
      };

      blur = {
        enabled = true;
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
