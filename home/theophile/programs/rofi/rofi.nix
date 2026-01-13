{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;

    plugins = with pkgs; [
      rofi-emoji
      rofi-calc
    ];

    extraConfig = {
      show-icons = true;
    };
  };
}
