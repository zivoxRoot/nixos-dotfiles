{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.username = "theophile";
  home.homeDirectory = "/home/theophile";

  imports = [
    ./programs/ohmyposh.nix
    ./programs/shell/zsh.nix
    ./programs/kitty.nix
    ./programs/nvf.nix
    ./programs/git.nix
    ./programs/zen.nix
    ./programs/wm
    ./programs/vscode
  ];

  home.packages = with pkgs; [
    # Hyprland
    rofi
    waybar
    wl-clipboard
    pywalfox-native
    nautilus
    zathura

    # Terminal
    ripgrep
    fd
    fzf
    eza
    trash-cli
    bat

    # Programming
    nixfmt-rfc-style
    lazygit
    vscode

    # Font
    cascadia-code
  ];

  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
    NIXOS_OZONE_WL = "1";
  };

  home.stateVersion = "25.11";
}
