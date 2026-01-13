{ ... }:

{
  wayland.windowManager.hyprland.settings.windowrule = [
    "suppressevent maximize, class:.*"
    "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"

    # Set workspaces to most used apps
    "workspace 1,class:^(org.telegram.desktop)$"
    "workspace 2,class:^(zen|zen-beta|zen-browser)$"
    "workspace 3,class:^(code)$"
    "workspace 4,class:^(kitty)$"
  ];
}
