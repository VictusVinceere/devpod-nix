{ 
  packageOverrides = pkgs: with pkgs; 
  let
    unstable = import (fetchTarball https://nixos.org/channels/nixpkgs-unstable/nixexprs.tar.xz) { };
  in {
    myPackages = pkgs.buildEnv {
      name = "vinceere-tools";
      paths = [
        zsh
        zsh-completions

        unstable.neovim  # This will use the latest version from unstable
        nodePackages.npm  
        yarn              
        nvm
        tmux
        pure-prompt
        fd
        ripgrep
        fzf
        lazygit
        kubectl
        kubectx
        k9s
        fluxcd
        python3
        python3Packages.pip
        php
        php.packages.compose

        # Zsh plugins and customization
        oh-my-zsh
        zsh-autosuggestions
        zsh-syntax-highlighting
        zsh-history-substring-search
      ];
    };
  };
}
