{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    swww
    playerctl
  ];

  wayland.windowManager.hyprland.enable = true;

  imports = [
    ./monitors.nix
    ./startup.nix
    ./preferences.nix
    ./rules.nix
    ./look.nix
    ./animations.nix
    ./bindings
  ];
}
