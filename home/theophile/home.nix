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
    ./programs/hyprland
    ./programs/vscode
    ./programs/waybar.nix
    ./programs/rofi/rofi.nix
  ];

  home.packages = with pkgs; [
    # Hyprland
    waybar
    wl-clipboard
    pywalfox-native
    nautilus
    zathura
    telegram-desktop

    # Terminal
    ripgrep
    fd
    fzf
    eza
    trash-cli
    bat
    htop

    # Programming
    nixfmt-rfc-style
    lazygit
    vscode

    # Font
    cascadia-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
  ];

  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
    NIXOS_OZONE_WL = "1";
  };

  home.stateVersion = "25.11";
}
