{ pkgs, ... }:

{
  programs.vscode.profiles.default = {
    enable = true;
    enableUpdateCheck = false;

    extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      albert.tabout
      alefragnani.bookmarks
      christian-kohler.path-intellisense
      dlasagno.wal-theme
      esbenp.prettier-vscode
      formulahendry.auto-close-tag
      mhutchie.git-graph
      pkief.material-icon-theme
      pkief.material-product-icons
      pomdtr.excalidraw-editor
      vscodevim.vim
      yzhang.markdown-all-in-one
    ];
  };
}
