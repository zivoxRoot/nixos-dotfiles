{ ... }:

{
  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
    "swww-daemon"

    # Open most used apps
    "Telegram"
    "kitty"
    "code --enable-features=UseOzonePlatform --ozone-platform=wayland"
    "zen"
  ];
}
