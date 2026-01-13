rec {
  super = "SUPER";

  # Apps
  terminal = "kitty";
  browser = "zen";
  file_manager = "nautilus";
  code_editor = "code --enable-features=UseOzonePlatform --ozone-platform=wayland";
  app_menu = "rofi -show drun";
  emoji_menu = "rofi -show emoji";
  calc_menu = "rofi -show calc";

  # Preferences
  language = "fr";
  natural_scroll = true;

  # Look
  gaps_in = 8;
  gaps_out = 16;
  border_size = 2;
  rounding = 10;
  active_opacity = 0.95;
  inactive_opacity = 0.8;
  dim_special = 0.75;
  shadow_enabled = true;
  blur_enabled = true;

  # Apps
  kb_terminal = "${super}, T";
  kb_browser = "${super}, B";
  kb_file_manager = "${super}, E";
  kb_code_editor = "${super}, C";
  kb_app_menu = "${super}, SPACE";
  kb_emoji_menu = "${super}_ALT, E";
  kb_calc_menu = "${super}_ALT, C";

  # Tiling
  killactive = "${super}, Q";

  # Utils
  toggle_waybar = "${super}, W";
}
