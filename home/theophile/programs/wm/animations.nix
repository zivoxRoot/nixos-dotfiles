{ ... }:

{
  wayland.windowManager.hyprland.settings.animations = {
    enabled = true;

    bezier = [
      "overshot, 0.05, 0.9, 0.1, 1.1"
      "fluid, 0.25, 1, 0, 1"
      "snap, 0.5, 0.9, 0.1, 1.05"
      "menu_decel, 0.1, 1, 0, 1"
      "liner, 1, 1, 1, 1"
    ];

    animation = [
      "windowsIn, 1, 7, overshot, popin 80%"
      "windowsOut, 1, 5, snap, popin 80%"
      "windowsMove, 1, 7, overshot, slide"
      "border, 1, 2, liner"
      "borderangle, 1, 40, liner, once"
      "fade, 1, 5, fluid"
      "layersIn, 1, 6, overshot, popin 70%"
      "layersOut, 0, 0, menu_decel, slide"
      "fadeLayersIn, 1, 5, menu_decel"
      "fadeLayersOut, 1, 4, menu_decel"
      "workspaces, 1, 8, overshot, slidevert"
      "specialWorkspace, 1, 8, overshot, slide"
    ];
  };
}
