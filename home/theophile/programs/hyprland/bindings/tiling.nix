{ ... }:

let
  vars = import ../variables.nix;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "${vars.killactive}, killactive"

      # Windows settings
      "${vars.super}, V, togglefloating"
      "${vars.super}, P, pseudo"
      "${vars.super}, Y, togglesplit"
      "${vars.super}, F, fullscreen, 0"
      "${vars.super}_SHIFT, F, fullscreen, 1"
      "${vars.super}_SHIFT, X, pin"

      # Switch between workspace with SUPER + [0-9]
      "${vars.super}, code:10, workspace, 1"
      "${vars.super}, code:11, workspace, 2"
      "${vars.super}, code:12, workspace, 3"
      "${vars.super}, code:13, workspace, 4"
      "${vars.super}, code:14, workspace, 5"
      "${vars.super}, code:15, workspace, 6"
      "${vars.super}, code:16, workspace, 7"
      "${vars.super}, code:17, workspace, 8"
      "${vars.super}, code:18, workspace, 9"
      "${vars.super}, code:19, workspace, 10"

      # Move window to workspace with SUPER + Shift + [0-9]
      "${vars.super}_SHIFT, code:10, movetoworkspace, 1"
      "${vars.super}_SHIFT, code:11, movetoworkspace, 2"
      "${vars.super}_SHIFT, code:12, movetoworkspace, 3"
      "${vars.super}_SHIFT, code:13, movetoworkspace, 4"
      "${vars.super}_SHIFT, code:14, movetoworkspace, 5"
      "${vars.super}_SHIFT, code:15, movetoworkspace, 6"
      "${vars.super}_SHIFT, code:16, movetoworkspace, 7"
      "${vars.super}_SHIFT, code:17, movetoworkspace, 8"
      "${vars.super}_SHIFT, code:18, movetoworkspace, 9"
      "${vars.super}_SHIFT, code:19, movetoworkspace, 10"

      # Move window to workspace (silently) with SUPER + Alt + [0-9]
      "${vars.super}_ALT, code:10, movetoworkspacesilent, 1"
      "${vars.super}_ALT, code:11, movetoworkspacesilent, 2"
      "${vars.super}_ALT, code:12, movetoworkspacesilent, 3"
      "${vars.super}_ALT, code:13, movetoworkspacesilent, 4"
      "${vars.super}_ALT, code:14, movetoworkspacesilent, 5"
      "${vars.super}_ALT, code:15, movetoworkspacesilent, 6"
      "${vars.super}_ALT, code:16, movetoworkspacesilent, 7"
      "${vars.super}_ALT, code:17, movetoworkspacesilent, 8"
      "${vars.super}_ALT, code:18, movetoworkspacesilent, 9"
      "${vars.super}_ALT, code:19, movetoworkspacesilent, 10"

      # Special workspace
      "${vars.super}, S, togglespecialworkspace, magic"
      "${vars.super}_SHIFT, S, movetoworkspace, special:magic"
    ];

    bindm = [
      # Move/Resize windows with mouse
      "${vars.super}, mouse:272, movewindow"
      "${vars.super}, mouse:273, resizewindow"
      "${vars.super}, Z, movewindow"
      "${vars.super}, X, resizewindow"
    ];

    binde = [
      # Move window focus with SUPER + vim keys
      "${vars.super}, H, movefocus, l"
      "${vars.super}, L, movefocus, r"
      "${vars.super}, K, movefocus, u"
      "${vars.super}, J, movefocus, d"

      # Move windows with SUPER + Shift + vim keys
      "${vars.super}_SHIFT, L, movewindow, r"
      "${vars.super}_SHIFT, H, movewindow, l"
      "${vars.super}_SHIFT, K, movewindow, u"
      "${vars.super}_SHIFT, J, movewindow, d"

      # Resize active window with SUPER + Ctrl + vim keys
      "${vars.super}_CONTROL, L, resizeactive, 30 0"
      "${vars.super}_CONTROL, H, resizeactive, -30 0"
      "${vars.super}_CONTROL, K, resizeactive, 0 -30"
      "${vars.super}_CONTROL, J, resizeactive, 0 30"

      # Navigate to last workspace back and forth
      "${vars.super}, TAB, workspace, previous"

      # Navigate relative workspaces with SUPER + Shift + [J / K]
      "${vars.super}_ALT, J, workspace, r+1"
      "${vars.super}_ALT, K, workspace, r-1"
    ];
  };
}
