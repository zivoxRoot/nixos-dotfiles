{ ... }:

{
  virtualisation.docker.enable = true;
  users.users."theophile".extraGroups = [ "docker" ];
}
