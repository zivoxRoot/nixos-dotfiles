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
  ];

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    iw
  ];
}
