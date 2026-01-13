{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    font = "CaskaydiaCove Nerd Font Mono 14";

    plugins = with pkgs; [
      rofi-emoji
      rofi-calc
    ];

    extraConfig = {
      show-icons = true;
    };
  };
}
