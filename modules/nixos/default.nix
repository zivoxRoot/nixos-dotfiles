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
  ];

  programs.zsh.enable = true;

  environment.systemPackages = with pkgs; [
    # inputs.zen-browser.packages."${pkgs.stdenv.hostPlatform.system}".default
    vim
  ];
}
