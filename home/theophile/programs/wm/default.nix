{ pkgs, ... }:

{
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
