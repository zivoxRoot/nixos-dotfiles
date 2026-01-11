{ pkgs, ... }:

{
  home.packages = [ pkgs.zoxide ];

  # Prevents new user dialog in zsh
  # system.userActivationScripts.zshrc = "touch .zshrc";

  imports = [
    ./aliases.nix
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    history = {
      size = 10000;
      ignoreAllDups = true;
      path = "$HOME/.zsh_history";
    };

    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.zsh-syntax-highlighting;
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.zsh-autosuggestions;
      }
      {
        name = "zsh-completions";
        src = pkgs.zsh-completions;
      }
    ];

    initContent = ''
      # Zsh keybindings
      bindkey '^[f' autosuggest-accept
      bindkey '^[j' history-search-forward
      bindkey '^[k' history-search-backward
      bindkey '^[l' forward-word
      bindkey '^[h' backward-word

      # Zsh options
      setopt autocd
      setopt correct

      # History
      setopt appendhistory
      setopt sharehistory
      setopt hist_ignore_space
      setopt hist_ignore_all_dups
      setopt hist_save_no_dups
      setopt hist_ignore_dups
      setopt hist_find_no_dups

      # Completion styling
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

      # FZF
      source <(${pkgs.fzf}/bin/fzf --zsh)

      # Zoxide
      eval "$(${pkgs.zoxide}/bin/zoxide init --cmd cd zsh)"
    '';
  };
}
