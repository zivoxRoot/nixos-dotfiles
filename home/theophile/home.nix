{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  home.username = "theophile";
  home.homeDirectory = "/home/theophile";

  imports = [
    inputs.zen-browser.homeModules.beta
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
    jq
    impala

    # Programming
    nixfmt-rfc-style
    lazygit
    vscode

    # Font
    cascadia-code
    nerd-fonts.caskaydia-cove
    nerd-fonts.caskaydia-mono
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
  ];

  home.sessionVariables = {
    MANPAGER = "nvim +Man!";
    NIXOS_OZONE_WL = "1";
  };

  home.stateVersion = "25.11";
}
