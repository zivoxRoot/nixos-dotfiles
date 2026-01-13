{ ... }:

let
  vars = import ../variables.nix;
in
{
  imports = [
    ./media.nix
    ./tiling.nix
    ./apps.nix
    ./utils.nix
  ];
}
