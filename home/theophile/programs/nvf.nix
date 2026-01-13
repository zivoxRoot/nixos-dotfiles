{ ... }:

{
  programs.nvf = {
    enable = true;

    settings = {

      vim = {
        theme = {
          enable = true;
        };

        options = {
          number = true;
          relativenumber = true;
          expandtab = true;
          shiftwidth = 2;
          tabstop = 2;
        };

        git = {
          enable = true;
          gitsigns = {
            enable = true;
          };
        };

        telescope.enable = true;

        lsp = {
          enable = true;

          formatOnSave = true;

          servers = {
            pyright.enable = true;
            tsserver.enable = true;
            nil_ls.enable = true;
          };
        };

        languages = {
          nix = {
            treesitter.enable = true;
            format = {
              enable = true;
              type = "nixfmt";
            };
          };
          python = {
            treesitter.enable = true;
          };
          ts = {
            treesitter.enable = true;
          };
        };
      };
    };
  };
}
