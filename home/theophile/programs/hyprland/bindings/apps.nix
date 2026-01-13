{ ... }:

let
  vars = import ../variables.nix;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "${vars.super}, T, exec, ${vars.terminal}"
      "${vars.super}, B, exec, ${vars.browser}"
      "${vars.super}, E, exec, ${vars.file_manager}"
      "${vars.super}, C, exec, ${vars.code_editor}"
      "${vars.super}, SPACE, exec, ${vars.app_menu}"
      "${vars.super}_ALT, E, exec, ${vars.emoji_menu}"
      "${vars.super}_ALT, C, exec, ${vars.calc_menu}"
    ];
  };
}
