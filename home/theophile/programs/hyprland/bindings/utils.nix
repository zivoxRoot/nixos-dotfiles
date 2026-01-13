{ ... }:

let
  vars = import ../variables.nix;
in
{

  wayland.windowManager.hyprland.settings = {
    bind = [
      "${vars.toggle_waybar}, exec, pkill waybar || waybar"
    ];
  };
}
