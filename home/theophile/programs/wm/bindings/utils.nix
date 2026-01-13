{ ... }:

let
  vars = import ../variables.nix;
in
{

  wayland.windowManager.hyprland.settings = {
    bind = [
      "${vars.super}, W, exec, pkill waybar || waybar"
    ];
  };
}
