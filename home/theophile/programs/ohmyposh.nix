{ pkgs, ... }:

{
  home.packages = [ pkgs.oh-my-posh ];

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      version = 3;
      final_space = true;

      console_title_template = "{{ .Shell }} in {{ .Folder }}";

      secondary_prompt = {
        template = "❯❯ ";
        foreground = "magenta";
        background = "transparent";
      };

      transient_prompt = {
        template = "❯";
        foreground = "magenta";
        background = "transparent";
      };

      blocks = [
        # Left prompt (path + git)
        {
          type = "prompt";
          alignment = "left";
          newline = true;

          segments = [
            {
              type = "path";
              style = "plain";
              template = "{{ .Path }}";
              foreground = "blue";
              background = "transparent";

              properties = {
                cache_duration = "none";
                style = "full";
              };
            }

            {
              type = "git";
              style = "plain";
              template = " {{ .HEAD }}{{ if or (.Working.Changed) (.Staging.Changed) }}*{{ end }} <cyan>{{ if gt .Behind 0 }}⇣{{ end }}{{ if gt .Ahead 0 }}⇡{{ end }}</>";
              foreground = "grey";
              background = "transparent";

              properties = {
                branch_icon = "";
                cache_duration = "none";
                commit_icon = "@";
                fetch_status = true;
              };
            }
          ];
        }

        # Right prompt (execution time)
        {
          type = "rprompt";
          overflow = "hidden";

          segments = [
            {
              type = "executiontime";
              style = "plain";
              template = "{{ .FormattedMs }}";
              foreground = "yellow";
              background = "transparent";

              properties = {
                cache_duration = "none";
                threshold = 5000;
              };
            }
          ];
        }

        # Final prompt symbol
        {
          type = "prompt";
          alignment = "left";
          newline = true;

          segments = [
            {
              type = "text";
              style = "plain";
              template = "❯";
              background = "transparent";

              foreground_templates = [
                "{{ if gt .Code 0 }}red{{ end }}"
                "{{ if eq .Code 0 }}magenta{{ end }}"
              ];

              properties = {
                cache_duration = "none";
              };
            }
          ];
        }
      ];
    };
  };
}
