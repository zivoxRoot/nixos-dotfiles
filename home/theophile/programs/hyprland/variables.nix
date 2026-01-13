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
  kb_terminal = "${super}_SHIFT, T";
  kb_browser = "${super}_SHIFT, B";
  kb_telegram = "${super}_SHIFT, M";
  kb_code_editor = "${super}_SHIFT, C";
  # Focus main apps
  kb_terminal_focus = "${super}, T";
  kb_browser_focus = "${super}, B";
  kb_telegram_focus = "${super}, M";
  kb_code_editor_focus = "${super}, C";

  kb_file_manager = "${super}_SHIFT, E";
  kb_app_menu = "${super}, SPACE";
  kb_emoji_menu = "${super}_ALT, E";
  kb_calc_menu = "${super}_ALT, C";

  # Tiling
  killactive = "${super}, Q";

  # Utils
  toggle_waybar = "${super}, W";
}
