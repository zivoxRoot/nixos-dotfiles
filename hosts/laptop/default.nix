{ ... }:

{
  networking.hostName = "nixos";

  imports = [
    ./hardware-configuration.nix
  ];
}
