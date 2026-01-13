{ ... }:

let
  super = "SUPER";
  browser = "zen";
  file_manager = "nautilus";
  code_editor = "code --enable-features=UseOzonePlatform --ozone-platform=wayland";
  app_menu = "rofi -show drun";
  emoji_menu = "rofi -show emoji";
  calc_menu = "rofi -show calc";
  terminal = "kitty";
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "${super}, Q, killactive"
      "${super}, T, exec, ${terminal}"
      "${super}, B, exec, ${browser}"
      "${super}, E, exec, ${file_manager}"
      "${super}, C, exec, ${code_editor}"
      "${super}, SPACE, exec, ${app_menu}"
      "${super}_ALT, E, exec, ${emoji_menu}"
      "${super}_ALT, C, exec, ${calc_menu}"
      "${super}, V, togglefloating"
      "${super}, P, pseudo"
      "${super}, Y, togglesplit"

      "${super}, H, movefocus, l"
      "${super}, L, movefocus, r"
      "${super}, K, movefocus, u"
      "${super}, J, movefocus, d"

      "${super}, code:10, workspace, 1"
      "${super}, code:11, workspace, 2"
      "${super}, code:12, workspace, 3"
      "${super}, code:13, workspace, 4"
      "${super}, code:14, workspace, 5"
      "${super}, code:15, workspace, 6"
      "${super}, code:16, workspace, 7"
      "${super}, code:17, workspace, 8"
      "${super}, code:18, workspace, 9"
      "${super}, code:19, workspace, 10"

      # Move window to workspace
      "${super}_SHIFT, code:10, movetoworkspace, 1"
      "${super}_SHIFT, code:11, movetoworkspace, 2"
      "${super}_SHIFT, code:12, movetoworkspace, 3"
      "${super}_SHIFT, code:13, movetoworkspace, 4"
      "${super}_SHIFT, code:14, movetoworkspace, 5"
      "${super}_SHIFT, code:15, movetoworkspace, 6"
      "${super}_SHIFT, code:16, movetoworkspace, 7"
      "${super}_SHIFT, code:17, movetoworkspace, 8"
      "${super}_SHIFT, code:18, movetoworkspace, 9"
      "${super}_SHIFT, code:19, movetoworkspace, 10"

      # Special workspace
      "${super}, S, togglespecialworkspace, magic"
      "${super}_SHIFT, S, movetoworkspace, special:magic"

    ];

    bindm = [
      # Move/Resize windows with mouse
      "${super}, mouse:272, movewindow"
      "${super}, mouse:273, resizewindow"
    ];

    bindl = [
      ", X86AudioNext, exec, playerctl next"
      ", X86AudioPause, exec, playerctl play-pause"
      ", X86AudioPlay, exec, playerctl play-pause"
      ", X86AudioPrev, exec, playerctl previous"
    ];

    bindel = [
      # Volume
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      # Precise
      "ALT, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+"
      "ALT, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-"

      # Brightness
      ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
      # Precise
      "ALT, XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 1%+"
      "ALT, XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 1%-"

    ];
  };
}
