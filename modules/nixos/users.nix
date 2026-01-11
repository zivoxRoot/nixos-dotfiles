{ config, pkgs, ... }:

{
  users.users.theophile = {
    isNormalUser = true;
    description = "theophile";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
}
