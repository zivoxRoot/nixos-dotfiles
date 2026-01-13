{ ... }:

{
  wayland.windowManager.hyprland.settings = {
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
