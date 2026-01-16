{
  config,
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    ./users.nix
    ./desktop.nix
    ./system.nix
    ./stylix.nix
    ./optimization.nix
    ./docker.nix
  ];

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    iw
  ];
}
