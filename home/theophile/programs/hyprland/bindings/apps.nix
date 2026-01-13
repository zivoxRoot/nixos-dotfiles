{ ... }:

let
  vars = import ../variables.nix;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      "${vars.kb_terminal}, exec, ${vars.terminal}"
      "${vars.kb_browser}, exec, ${vars.browser}"
      "${vars.kb_file_manager}, exec, ${vars.file_manager}"
      "${vars.kb_code_editor}, exec, ${vars.code_editor}"
      "${vars.kb_app_menu}, exec, ${vars.app_menu}"
      "${vars.kb_emoji_menu}, exec, ${vars.emoji_menu}"
      "${vars.kb_calc_menu}, exec, ${vars.calc_menu}"
    ];
  };
}
