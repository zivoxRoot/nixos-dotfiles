{ lib, ... }:

{
  programs.kitty = lib.mkForce {
    enable = true;
    settings = {
      confirm_os_window_close = 0;
      enable_audio_bell = false;
      window_padding_width = 10;
      font_family = "CaskaydiaCove Nerd Font Mono";
      bold_font = "auto";
      italic_font = "auto";
      disable_ligature = "never";
      font_size = 11;
      cursor_trail = 1;
      scrollback_lines = 10000;
    };
  };
}
