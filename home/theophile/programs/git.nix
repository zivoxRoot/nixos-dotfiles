{ pkgs, ... }:

{
  home.packages = [ pkgs.delta ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "zivoxRoot";
        email = "theophiledefeche@ik.me";
      };
      core = {
        editor = "nvim";
        pager = "delta";
      };
      init.defaultBranch = "main";
      interactive.diffFilter = "delta --color-only";
      delta = {
        navigate = true; # Use n and N to move between diff sections
        dark = true;
        side-by-side = true;
      };
      merge.conflictStyle = "zdiff3";
    };
  };
}
