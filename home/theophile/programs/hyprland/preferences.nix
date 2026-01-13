{ ... }:

let
  vars = import ./variables.nix;
in
{
  wayland.windowManager.hyprland.settings.input = {
    kb_layout = vars.language;
    kb_options = "caps:swapescape";

    follow_mouse = 1;

    touchpad.natural_scroll = vars.natural_scroll;
  };
}
