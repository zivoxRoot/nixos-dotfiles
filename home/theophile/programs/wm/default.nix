{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brightnessctl
    swww
    playerctl
  ];

  imports = [
    ./monitors.nix
    ./startup.nix
    ./preferences.nix
    ./rules.nix
    ./look.nix
    ./animations.nix
    ./bindings.nix
  ];
}
